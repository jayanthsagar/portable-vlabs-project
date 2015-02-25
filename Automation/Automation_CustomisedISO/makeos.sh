start=$(pwd)
sudo apt-get install uck
sudo uck-remaster-clean
sudo uck-remaster-unpack-iso ubuntu-12.10-desktop-i386.iso
sudo uck-remaster-unpack-rootfs
cp libflashplayer.so ~/tmp/remaster-root/usr/lib/mozilla/plugins/
tar -xvzf xampp-linux-1.7.7.tar.gz -C ~/tmp/remaster-root/opt/
touch newfile
touch newfile2
cat ~/livecdtmp/edit/opt/lampp/etc/httpd.conf | head -391 >> newfile
echo "    AddType application/x-java-jnlp-file .jnlp" >> newfile
echo "    AddType application/x-java-archive .jar" >> newfile
echo "    AddType application/x-java-archive-diff .jardiff" >> newfile
cat ~/livecdtmp/edit/opt/lampp/etc/httpd.conf | tail -391 >> newfile
cat ./newfile | head -240 >> newfile2
echo "    DirectoryIndex home.php" >> newfile2
cat ./newfile | tail -240 >> newfile2
sed -i s/Indexes/-Indexes/g newfile2
rm ~/livecdtmp/edit/opt/lampp/etc/httpd.conf
mv newfile2 ~/livecdtmp/edit/opt/lampp/etc/httpd.conf
rm newfile newfile2
sudo uck-remaster-chroot-rootfs < uck2.sh
echo "Copying..........."
rsync -ah --progress $start/htdocs/* ~/tmp/remaster-root/opt/lampp/htdocs/
chown -R nobody:nogroup ~/tmp/remaster-root/opt/lampp/htdocs/
chmod -R +x ~/tmp/remaster-root/opt/lampp/htdocs/*
echo 'sudo /opt/lampp/lampp start' | cat - ~/tmp/remaster-root/etc/rc.local > temp && mv temp ~/tmp/remaster-root/etc/rc.local
sudo uck-remaster-pack-rootfs
sudo uck-remaster-pack-iso ubuntu12custom.iso


