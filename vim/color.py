import sys
def printf(col,col2,*string):
    """ color.printf function provide colored output of string
    use:
        printf ("red","black-bg","string")
        printf ("bg-red",'black-fg','string')
        printf ('fgred','black','sting')

    """
    temp,temp2,tep,x,y,flag,reset=col,col2,'','','',False,'\033[0m'
    col,col2=col.upper(),col2.upper()
    col_list={'BLACK':30,'RED':31,'GREEN':32,'YELLOW':33,'BLUE':34,'MAGENTA':35,'CYAN':36,'WHITE':37}
    col2_list={'BLACK':30,'RED':31,'GREEN':32,'YELLOW':33,'BLUE':34,'MAGENTA':35,'CYAN':36,'WHITE':37}
    if col.find('BG')!=-1:
        col=col.replace('BG','')
        col=col.replace('-','')
        for i in col_list.keys():
            col_list[i]=col_list[i]+10
    elif col.find('FG')!=-1:
        col=col.replace('FG','')
        col=col.replace('-','')
    if col2.find('BG')!=-1:
        col2=col2.replace('BG','')
        col2=col2.replace('-','')
        for i in col2_list.keys():
            col2_list[i]=col2_list[i]+10
    elif col2.find('FG')!=-1:
        col2=col2.replace('FG','')
        col2=col2.replace('-','')
    for i in string:
        tep=tep+''+str(i)
    if col2 in col2_list:
        x='\033['+str(col2_list[col2])+'m'
        flag=True
    else:
        tep=temp2+''+tep
    if col in col_list:
        y='\033['+str(col_list[col])+'m'
        flag=True
    else:
        tep=temp+''+tep
    if flag:
        tep=x+y+tep+reset
    sys.stdout.write (tep)
    sys.stdout.flush()
