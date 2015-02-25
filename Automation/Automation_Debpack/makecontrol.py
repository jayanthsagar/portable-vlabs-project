import os
import sys
v=sys.argv[1]
s=v.split("/")[-3]
i,l=0,len(s)
while i<len(s):
    if not(s[i].isalnum() or s[i]=='+' or s[i]=='-' or s[i]=='.'): s=s[0:i]+'-'+s[i+1:]
    i+=1
os.chdir(v)
os.mkdir("DEBIAN")
fil=open("DEBIAN/control","w+")
fil.write("Section: x11\n")
fil.write("Priority: extra\n")
fil.write("Maintainer:"+" "+"Vlabs"+' '+'<'+'engg@vlabs.ac.in'+'>\n')
fil.write("Build-Depends: php5, git, mysql-server, libapache2-mod-auth-mysql, php5-mysql, libapache2-mod-php5, php5-mcrypt\n")
fil.write("Standards-Version: "+"1.0"+'\n')
fil.write("Homepage: http://vlab.co.in\n")
fil.write("Package: "+s+'\n')
fil.write("Architecture: all\n")
fil.write("Version: "+"1.0"+'\n')
fil.write("Depends: php5, apache2, git, mysql-server, libapache2-mod-auth-mysql, php5-mysql, libapache2-mod-php5, php5-mcrypt\n")
fil.write("Description: "+s+' lab package\n') 
fil.close()
print s

