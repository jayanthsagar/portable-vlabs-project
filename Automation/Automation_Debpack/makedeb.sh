#!/bin/bash     
T0=$(pwd) #storing current working directory
cd $1
result=${PWD##*/}
cd src #going to source file
make #makes build from src
cd .. 
sudo rm -rf $result'-build'
mkdir $result'-build'
mv build/* $result'-build'/
sudo rm -rf build
cd $result'-build'
sudo rm -rf DEBIAN/
sudo rm -rf opt/
cd $T0
T9=$(python makecontrol.py $1/$result'-build')
python improvedir.py $1'/'$result'-build'
cd $1/$result'-build'/DEBIAN
touch conffiles  md5sums  postint  prerm
cd ..
find . -type f ! -regex '.*.hg.*' ! -regex '.*?debian-binary.*' ! -regex '.*?DEBIAN.*' -printf '%P '| xargs md5sum > DEBIAN/md5sums
cd ~ 
rm -rf tempaskddd
mkdir tempaskddd
cp -R $1/$result'-build' ~/tempaskddd/
cd $1/$result'-build'
sudo rm -rf opt/
mkdir opt
mkdir opt/lampp/
mkdir opt/lampp/htdocs/
T1=$(pwd)
cd ..
cp -R ~/tempaskddd/$result'-build'/ $T1/opt/lampp/htdocs/
rm -rf ~/tempaskddd
sudo chmod 775 -R $T1

echo Enter the path for storing the Debian package:
read path

if [ -n "$path" ]
then
echo The Debian Package will be made in $path by the name $T9 .
dpkg -b $T1/ $path/$T9'.deb'
else
echo The Debian Package will be made in the 'home directory' by the name $T9 .
dpkg -b $T1/ ~/$T9'.deb'
fi






