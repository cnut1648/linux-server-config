"""
convert string args to list of str, as required by vs code debugger
"""
import sys
args = sys.argv[1]
print(args.split())
