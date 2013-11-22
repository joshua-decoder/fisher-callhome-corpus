#!/bin/env python

import sys

if len(sys.argv) != 2:
  print "Usage: %s <mapping file>" % sys.argv[0]
  sys.exit(1)

transcript = None
mapping = {}
for line in sys.stdin:
  if line.startswith('##'):
    transcript = line.strip().split(' ')[2]
    lineno = 1
  else:
    mapping[(transcript,`lineno`)] = line.strip()
    lineno += 1

for line in open(sys.argv[1]):
  transcript, ids = line.split()
  output = " ".join(mapping[(transcript,x)] for x in ids.split('_'))
  print output
