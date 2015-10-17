import os
import color
color.printf ('black','whitebg',"Commit: ")
txt=''
while True:
    txt=txt+raw_input()
    if txt.find('\n'):
        break;
os.system('git commit -m '+'"'+str(txt)+'"')
