import os, sys, json
from subprocess import run as exec_process
from debase.cl_args import parse_args
from pathlib import Path

def errs(*args, **kwargs):
  print(*args, file=sys.stderr, **kwargs)

def run_process(args, _cwd):
  if type(args) is list:
    args = ' '.join(args)
  return exec_process(args, cwd=_cwd, capture_output=True, text=True)

def run_debaser(debase_bin, args):
  o = Path(args.output)
  target = Path(args.target)
  jsonout = args.jsonout
  passthrough = args.passthrough.split(';')
  passthrough.extend(['--allow-no-builtins', '--permissive'])

  if not (target / o).exists():
    errs('target', target.as_posix(), 'does not exist!')
    sys.exit(1)

  (o / 'lib').mkdir(parents=True, exist_ok=True)

  debase_args = [
    debase_bin,
    (o / target).as_posix(),
    '-o', (o / 'lib').as_posix(),
    f'--output-filenames={jsonout}',
    *passthrough,
    *args.files
  ]

  #print(debase_args)
  result = run_process(debase_args, str(o))
  if result.returncode != 0:
    errs('failed to run debaser!')
    errs(result.stderr.strip())
    sys.exit(result.returncode)
  
  return (o / 'lib' / jsonout)

def run_llc(llc_bin, args, bc_files: list[str]):
  o = Path(args.output) / 'opt'
  o.mkdir(exist_ok=True)

  llc_O = {
    'Debug': ['-O=0', '--frame-pointer=none'],
    'RelWithDebInfo': ['-O=2', '--frame-pointer=non-leaf'],
    'MinSizeRel': ['-O=2', f'--frame-pointer={args.frame_pointer}'],
    'Release': ['-O=3', f'--frame-pointer={args.frame_pointer}'],
  }

  out_files = []
  failed = False

  for bc_file in bc_files:
    out = o / (Path(bc_file).stem + '.o')
    llc_args = [
      llc_bin,
      *llc_O[args.build_type],
      '--regalloc=pbqp', '-filetype=obj',
      '-o', out.as_posix(),
      bc_file
    ]

    #print(llc_args)
    result = run_process(llc_args, str(o))
    if result.returncode == 0:
      out_files.append(out.as_posix())
    else:
      errs('failed to run llc on', Path(bc_file).as_posix(), '!')
      errs(result.stderr.strip())
      failed = True
  
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
    '--verbose',
    '-o', o.as_posix(),
    *out_files,
  ]

  print(archive_args)
  result = run_process(archive_args, str(o))
  errs(result.stderr.strip())
  if result.returncode != 0:
    errs('archiving failed!')
    errs(result.stderr.strip())
    sys.exit(1)

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
  #print(out_files)
  run_archive(debase_bin, args, out_files)
  print('Generated archive!')
