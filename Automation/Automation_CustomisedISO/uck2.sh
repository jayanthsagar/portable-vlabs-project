#! /bin/bash
apt-get -y update
apt-get install -y vim firefox aptitude libreoffice
add-apt-repository -y ppa:ubuntu-wine/ppa
echo "deb http://archive.ubuntu.com/ubuntu quantal main restricted multiverse universe" >> ./etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu quantal-updates main restricted multiverse universe" >> ./etc/apt/sources.list
echo "deb http://archive.canonical.com/ubuntu quantal partner" >> ./etc/apt/sources.list
echo "deb http://extras.ubuntu.com/ubuntu quantal main" >> ./etc/apt/sources.list
apt-get -y update
apt-get install -y wine
apt-get install -y ngspice stellarium flashplugin-installer openjdk-7-jdk openjdk-7-jre icedtea-plugin
./opt/lampp/lampp stop
./opt/lampp/sbin/mysqld --skip-grant-tables --skip-networking &
./opt/lampp/bin/mysql -u root << EOF
flush privileges;
set password for root@'localhost' = password('root');
update mysql.user set password=password('root') where user='root';
flush privileges;
EOF
echo "The password for mysql is 'root'"
./opt/lampp/lampp restart
echo root | ./opt/lampp/bin/mysql -u root -p << EOF
create database sandeep4_virtual;"
EOF
./opt/lampp/bin/mysql -u root -p sandeep4_virtual < sandeep4_virtual.sql
apt-get install sudo
exit

