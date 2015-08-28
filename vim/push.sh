#!/usr/bin/expect
set timeout 40
set user [lindex $argv 0]
set pass [lindex $argv 1]
spawn  git push -u origin master
expect "*?sername*"
send "$user\r"
expect "*?assword*"
send "$pass\r"
interact
