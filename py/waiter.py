import argparse, os, sys, time

def errs(*args, **kwargs):
  print(*args, file=sys.stderr, **kwargs)

def parse_args():
  parser = argparse.ArgumentParser(prog="waiter")
  parser.add_argument(
    '--target', '--target-name',
    dest='target',
    type=str,
  )
  parser.add_argument(
    '--timeout',
    dest='timeout',
    type=int, default=10
  )
  return parser.parse_args()

def wait(fpath, timeout):
  n = 0
  while not os.path.exists(fpath):
    time.sleep(1)
    n += 1
    if n > timeout:
      errs('Timed out waiting for', fpath)
      sys.exit(1)


if __name__ == "__main__":
  args = parse_args()
  wait(args.target, args.timeout)
