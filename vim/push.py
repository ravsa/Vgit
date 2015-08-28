import subprocess,os,pickle
dir=subprocess.Popen('echo ~',shell=True,stdout=subprocess.PIPE)
home_dir=dir.stdout.read()[:-1]
exe=home_dir+'/'+'.vim'+'/'+'push.sh'
creds=home_dir+'/'+'.creds'
file=open(creds,'r')
data=pickle.load(file)
os.system(exe+' '+data[0]+' '+data[1]+'' )
print "Pushed to remote repo "
