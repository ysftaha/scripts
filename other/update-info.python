#!/usr/bin/python 
# https://unix.stackexchange.com/questions/17045/how-to-preserve-bookmarks-when-rearranging-pages-of-a-pdf-file-with-tools-like-p
output = open('res.info','w') 
with  open('in.info','r') as f:
  for line in f:
    if line.startswith("BookmarkPageNumber"):
      output.write( "BookmarkPageNumber: "+ str(int(line.split()[1])+1)+"\n")         
    else:
      output.write(line)
