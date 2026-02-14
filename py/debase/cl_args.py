import os, argparse
from pathlib import Path

def parse_args():
  parser = argparse.ArgumentParser(prog="debase")
  parser.add_argument(
    '--version', action='version',
    version="1.0.0"
  )

  parser.add_argument(
    '-D', '--dump',
    dest='dump',
    action='store_const',
    default=False, const=True
  )
  parser.add_argument(
    '--build-type',
    dest='build_type',
    type=str,
    choices=['Debug', 'Release', 'RelWithDebInfo', 'MinSizeRel'],
    help='the build type'
  )
  parser.add_argument(
    '--frame-pointer',
    dest='frame_pointer',
    type=str, default='all',
    choices=['all', 'non-leaf', 'none'],
    help='--frame-pointer=VALUE passed to LLC on Release'
  )
  parser.add_argument(
    '--target', '--target-name',
    dest='target',
    type=str,
    help='the target file'
  )
  parser.add_argument(
    '--archive', '--archive-name',
    dest='archive',
    type=str, default='',
    help='the output archive file'
  )
  parser.add_argument(
    '--rsp', '--rsp-name',
    dest='response',
    type=str, default='',
    help='the output response file'
  )
  parser.add_argument(
    '-o', '--output-dir',
    dest='output',
    type=Path, default=os.getcwd(),
    help='output directory'
  )
  parser.add_argument(
    '--output-filename', '--output-filenames',
    dest='jsonout',
    type=str,
    help='arguments passed to debase'
  )
  parser.add_argument(
    '--passthrough',
    dest='passthrough',
    type=str, default='',
    help='arguments passed to debase'
  )
  parser.add_argument(
    dest='files',
    action='extend',
    nargs='*',
    type=str, default=[],
    help='[filenames...]'
  )

  args = parser.parse_args()
  files = []
  for f in args.files:
    files.extend(f.split(';'))
  args.files = files
  return args
