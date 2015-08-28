import sys
def printf(col,*string):
    temp=col
    col=col.upper()
    col_list={'BLACK':30,'RED':31,'GREEN':32,'YELLOW':33,'BLUE':34,'MAGENTA':35,'CYAN':36,'WHITE':37}
    if col.find('BG')!=-1:
        col=col.replace('BG','')
        col=col.replace('-','')
        for i in col_list.keys():
            col_list[i]=col_list[i]+10
    elif col.find('FG')!=-1:
        col=col.replace('FG','')
        col=col.replace('-','')
    if col in col_list:
        x='\033['+str(col_list[col])+'m'
        reset='\033[0m'
        temp=''
        for i in string:
            temp=temp+' '+str(i)
        temp=x+temp+reset
        sys.stdout.write (temp)
        sys.stdout.flush()
    else:
        for i in string:
            temp=temp+' '+str(i)
        sys.stdout.write (temp)
        sys.stdout.flush()
