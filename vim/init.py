import os,pickle,subprocess,color
color.printf ('blue',"whitebg","Initializing...! \n")
data=[]
dir=subprocess.Popen('echo ~',shell=True,stdout=subprocess.PIPE)
home_dir=dir.stdout.read()[:-1]
creds=home_dir+'/'+'.creds'
dir=subprocess.Popen('pwd',shell=True,stdout=subprocess.PIPE)
cur_dir=dir.stdout.read()[:-1]
cur_dir=list(cur_dir.split('/'))[-1]
file=open(creds,'r')
data=pickle.load(file)
file.close()
if not os.path.isdir('.git'):
    os.system('git init >/dev/null')
create_repo='curl '+'-u '+"'"+data[0]+"'"+':'+"'"+data[1]+"'"+' https://api.github.com/user/repos '+'-d '+'"'+'{'+'\\"name\\"'+':'+'\\"'+cur_dir+'\\"'+'}'+'"'
os.system(create_repo+' 2>/dev/null >/dev/null')
os.system('git remote add origin https://github.com/'+data[0]+'/'+cur_dir+'.git'+' >/dev/null 2>/dev/null')
color.printf ("whitebg","green","Initialized")
