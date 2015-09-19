if vim --version | grep "+python" >> /dev/null
then
   while true
   do
      if which expect>>/dev/null
      then
        cp -rvf vimrc ~/.vimrc
        cp -rvf vim ~/.vim
        cp -rvf cheat_sheet.txt ~/
	echo "Succesfully added !"
	break;
      else
         echo 'Do you want to install it? [Y/N]'
         read ans
         if [ "$ans" = 'y' -o "$ans" = 'Y' ]
         then
            sudo apt-get install expect
         else
            break;
         fi
      fi
   done

else
   echo "ERROR: This plugin is not compatible with current version of vim"
fi
