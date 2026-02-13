import os, sys
from subprocess import run as run_process

def errs(*args, **kwargs):
  print(*args, file=sys.stderr, **kwargs)

def debase_main(args, debase_bin, llc_bin):
  #if not '-o' in args:
  #  errs('-o is required for debasing!')
  #  sys.exit(0)
  if not '--output-filenames' in args:
    args.append('--output-filenames')
  
  #sys.exit(1)
  pass
