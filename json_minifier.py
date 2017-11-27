#!/usr/bin/env python3
"""JSON minifier"""

import json
import sys

def minify(file_name):
    json_data = ''
    with open(file_name, 'r') as in_file:
        json_data = json.load(in_file)
    with open(file_name, 'w') as out_file:
        json.dump(json_data, out_file, separators=(',', ":"))

for arg in sys.argv[1:]:
    minify(arg)
