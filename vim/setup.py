import pickle,getpass
import os,subprocess
home_dir=subprocess.Popen('echo ~',shell=True,stdout=subprocess.PIPE)
home_dir=home_dir.stdout.read()[:-1]
creds=home_dir+'/'+'.creds'
gitconfig=home_dir+'/'+'.gitconfig'
def setup():
    data1=[]
    data1.append(raw_input("Enter email address: "))
    data1.append(raw_input("Enter Username : "))
    os.system('git config --global user.email '+'"'+data1[0]+'"')
    os.system('git config --global user.name '+'"'+data1[1]+'"')
try:
    file=open(gitconfig,'r')
    file.readline()
    x=file.readline()
    x=list(x.split())
    y=file.readline()
    y=list(y.split())
    if x[2] is '' or y[2] is '':
        setup()
    file.close()
except Exception,e:
    setup()
try:
    file=open(creds,'r')
    file.close()
except Exception,e:
    file=open(creds,'wb')
    data2=[]
    data2.append(raw_input("Enter username: "))
    data2.append(getpass.getpass("Enter Password: "))
    print data2
    pickle.dump(data2,file)
    file.close()
