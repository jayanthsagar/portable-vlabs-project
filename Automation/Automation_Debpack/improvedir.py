import sys
import os
v=sys.argv[1]
for root, dirs, filenames in os.walk(v):
    for filename in filenames:
	fullpath = os.path.join(root, filename)
	filename_split = os.path.splitext(fullpath)
	s, fileext = filename_split
	i,l=0,len(s)
	while i<l:
	    if s[i]==' ': s=s[0:i]+'_'+s[i+1:]
	    i+=1
	os.rename(fullpath, s + fileext)
