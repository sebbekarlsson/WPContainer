#!/usr/bin/python2.7
import sys


fname = sys.argv[1]
search = sys.argv[2]
replace = sys.argv[3]

contents = ''

with open(fname) as _file:
    contents = _file.read()
_file.close()

contents = contents.replace(search, replace)

with open(fname, 'w+') as _file:
    _file.write(contents)
_file.close()
