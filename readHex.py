# Simple script to convert hexadecimal stream to ascii byte by byte
# Rationale: a massive hex stream was found while investigating a 
# 	     malicious PDF. While decoding such artifacts can usually
# 	     be easily accomplished by copying/pasting into a web-based
# 	     decoder, if the data is too large, the request will break. 
#	     (Recall, ASP.NET web project were uploading files > 500K words
#	      breaks the web app). using this script we can decrypt locally
# 	     and easily with python. 
#
#
# TODO: Clean up the implementation; allow user to submit arbitrary files to read/write
#       Clean up printing so chars are printed on one line up to a fixed amount. 
f = open("hex_stream", "r")

#print(f.read().decode("hex"))
value1 = 0
value2 = 1
line = str(f.readline())
charCount = len(line)
while (value2 < charCount):
    print(str(line[value1]+line[value2]).decode("hex"))
    value1 += 2
    value2 += 2

