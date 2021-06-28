#!/bin/bash


echo "====================================="
echo "Compressing..."
echo "====================================="


rm -r backup-upload
mkdir backup-upload
cd /home/jules/backup-upload

a="Academics"
b="Fotos"
c="Partituras"
d="Varios"
e="Editing"


7z -v5G a $a.zip /home/jules/Desktop/$a/
7z -v5G a $b.zip /home/jules/Desktop/$b/
7z -v5G a $c.zip /home/jules/Desktop/$c/
7z -v5G a $d.zip /home/jules/Desktop/$d/
7z -v5G a $e.zip /home/jules/Desktop/$e/


echo "====================================="
echo "Compressing complete. Now Uploading..."
echo "====================================="

# idea of having 2 folders, one with the backup of the current month
# and another for the past month
# 3 rotating folders only (A, B, C)


#getting which folders exist
x=$(rclone lsd backup:backups | cut -c44 | xargs | cut -b1)
y=$(rclone lsd backup:backups | cut -c44 | xargs | cut -b3)

a_exists=false
b_exists=false
c_exists=false



if [ "$x"  ==  "A" ]
then
    a_exists=true
else
    b_exists=true
fi

if [ "$y"  ==  "C" ]
then
    c_exists=true
else
    b_exists=true
fi


if [ "$a_exists"  ==  true ] && [ "$b_exists"  ==  true ]
then
    rclone purge backup:backups/A
    rclone mkdir backup:backups/C
    rclone copy --ignore-size --ignore-checksum /home/jules/backup-upload backup:backups/C
fi


if [ "$b_exists"  ==  true ] && [ "$c_exists"  ==  true ]
then
    rclone purge backup:backups/B
    rclone mkdir backup:backups/A
    rclone copy --ignore-size --ignore-checksum /home/jules/backup-upload backup:backups/A
fi


if [ "$c_exists"  ==  true ] && [ "$a_exists"  ==  true ]
then
    rclone purge backup:backups/C
    rclone mkdir backup:backups/B
    rclone copy --ignore-size --ignore-checksum /home/jules/backup-upload backup:backups/B
fi



cd ..
rm -r backup-upload

echo "====================================="
echo "Finished succesfully"
echo "====================================="
