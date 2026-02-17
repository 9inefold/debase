import json, os, sys, subprocess
from debase.cl_args import parse_args
from pathlib import Path
from hashlib import sha512

def errs(*args, **kwargs):
  print(*args, file=sys.stderr, **kwargs)

def run_process(args, _cwd):
  if type(args) is list:
    args = ' '.join(args)
  return subprocess.run(args, cwd=_cwd, capture_output=True, text=True)

# We only want to skip processing if its *exactly* the same
def calculate_and_write_hash(debase_bin, args):
  o = Path(args.output)
  target = o / Path(args.target)
  json_result = o / 'lib' / args.jsonout
  hashfile = o / (args.target + '.sha512')
  # Binary hashes
  a = sha512(Path(debase_bin).read_bytes()).hexdigest()
  b = sha512(target.read_bytes()).hexdigest()
  # JSON hashes
  m = sha512()
  m.update(json_result.read_bytes())
  # CL stuff
  commands = ' '.join([
    args.frame_pointer,
    args.passthrough,
    ''.join(args.files)
  ])
  m.update(commands.encode())
  new_hash = a + b + m.hexdigest()
  hashfile.write_text(new_hash)
  return new_hash

def check_hash_for_target(debase_bin, args):
  o = Path(args.output)
  json_result = o / 'lib' / args.jsonout
  hashfile = o / (args.target + '.sha512')
  if (not json_result.exists()) or (not hashfile.exists()):
    # There can't be a hash
    return False
  # Read hash in
  old_hash = hashfile.read_text()
  # Calculate new hash
  new_hash = calculate_and_write_hash(debase_bin, args)
  # Check result
  return old_hash == new_hash

def run_debaser(debase_bin, args):
  o = Path(args.output)
  target = Path(args.target)
  jsonout = '--output-filenames=' + args.jsonout
  json_result = (o / 'lib' / args.jsonout)
  passthrough = args.passthrough.split(';')
  passthrough.extend(['--emit-all', '--allow-no-builtins', '--permissive'])

  if not (o / target).exists():
    errs('target', target.as_posix(), 'does not exist!')
    sys.exit(1)
  
  if check_hash_for_target(debase_bin, args):
    return json_result

  (o / 'lib').mkdir(parents=True, exist_ok=True)

  files = []
  for f in args.files:
    files.append(Path(f).absolute().as_posix())

  debase_args = [
    debase_bin,
    (o / target).as_posix(),
    '-o', (o / 'lib').as_posix(),
    jsonout,
    *passthrough,
    *files
  ]

  if args.dump:
    print(' '.join(debase_args))
  result = run_process(debase_args, str(o))
  if result.returncode != 0:
    errs(result.stderr.strip())
    errs('failed to run debaser!')
    sys.exit(result.returncode)
  
  calculate_and_write_hash(debase_bin, args)
  return json_result

def run_llc(llc_bin, args, bc_files: list[str]):
  o = Path(args.output) / 'opt'
  o.mkdir(exist_ok=True)

  llc_O = {
    'Debug': ['-O=0', '--frame-pointer=none'],
    'RelWithDebInfo': ['-O=2', '--frame-pointer=non-leaf'],
    'MinSizeRel': ['-O=2', f'--frame-pointer={args.frame_pointer}'],
    'Release': ['-O=3', f'--frame-pointer={args.frame_pointer}', '--regalloc=pbqp'],
  }

  out_files = []
  failed = False

  failures = 0
  max_failures = min(len(bc_files) // 3, 5)
  for bc_file in bc_files:
    out = o / (Path(bc_file).stem + '.o')
    llc_args = [
      llc_bin,
      *llc_O[args.build_type],
      '-filetype=obj',
      '-o', out.as_posix(),
      bc_file
    ]

    #print(' '.join(llc_args))
    result = run_process(llc_args, str(o))
    if result.returncode == 0:
      out_files.append(out.as_posix())
    else:
      errs('failed to run llc on', Path(bc_file).as_posix(), '!')
      errs(result.stderr.strip())
      failed = True
      failures += 1
    
    if failures > max_failures:
      break
  
  if failed:
    sys.exit(1)
  return out_files

def run_archive(debase_bin, args, out_files):
  o = Path(args.output)
  archive_only = '--archive-only'
  if len(args.archive) != 0:
    archive_only += f'={args.archive}'
  
  archive_args = [
    debase_bin,
    archive_only,
    '--permissive',
    '-o', o.as_posix(),
    *out_files,
    #'--verbose',
  ]

  print(' '.join(archive_args))
  result = run_process(archive_args, str(o))
  errs(result.stderr.strip())
  if result.returncode != 0:
    errs('archiving failed!')
    errs(result.stderr.strip())
    sys.exit(1)
  print('Generated archive!')

def generate_rsp(args, out_files):
  rsp = Path(args.response)
  if not rsp.is_absolute():
    rsp = Path(args.output) / rsp
  rsp.write_text(' '.join(out_files))
  print(f'Generated response file \"@out/{rsp.name}\"!')

def debase_main(debase_bin, llc_bin):
  args = parse_args()
  jsonout = run_debaser(debase_bin, args)
  json_data = json.loads(jsonout.read_text())

  if json_data['files'] is None:
    errs('invalid debase json output: could not find "files": [...]')
    sys.exit(1)
  
  bc_files = json_data['files']
  if type(bc_files) is str:
    bc_files = [bc_files]
  
  out_files = run_llc(llc_bin, args, bc_files)
  if args.dump:
    print('files:', ' '.join(out_files))
  #run_archive(debase_bin, args, out_files)
  generate_rsp(args, out_files)
