#!/bin/bash
#
# Simple shell script to adjust php.ini to your recommended settings.
#
#The script assumes you are using apache2 and php version 7.2
#
# uses phpIni to store file path - change if required
#
#make sure you have the correct php version by running php --version
#
#future improvements: automate getting the php version and the apache iteration
#Also make a web interface to update this values

phpIni=/etc/php/7.2/apache2/php.ini

if [ -e $phpIni ]
then
    echo 'Copies php.ini to current directory and creates a backup file'
    echo 'Modifies it and then displays variance for confirmation.'
    cp $phpIni php.ini.orig
    echo 'Setting max execution time to 600 seconds '
    sed -i 's/max_execution_time =.*/max_execution_time = 600/' phpIni
    echo 'Setting memory limit to 128M'
    sed -i 's/memory_limit =.*/memory_limit = 128M/' phpIni
    echo 'Setting post max size to 2048M'
    sed -i 's/post_max_size =.*/post_max_size = 2048M/' phpIni
    echo 'Setting max upload filesize to 1024M'
    sed -i 's/upload_max_filesize =.*/upload_max_filesize = 1024M/' phpIni
    echo 'php.ini adjusted!'
    echo
    echo 'Display the changes made'
    diff php.ini.orig phpIni

    echo 'If happy with the changes go ahead and restart apache.'
    echo 'If not satisfied and want the original php.ini file just restore the php.ini.orig by renaming it to php.ini.'

else
    echo 'php.ini was not located as expected. Please adjust phpIni to suit.'
fi
