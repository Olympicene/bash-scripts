#!/bin/bash

%F=$1 
%L=$2

output=/home/qbittorrent-nox/output.txt

echo "%F:" $1 >> $output
echo "%L:" $2 >> $output

if [ $2 == 'Anime' ]
then
	filebot -rename -r "$1" --db AniDB -non-strict --action duplicate --output /mnt/nfs_share/ --format "{ db.TheTVDB.plex }" >> $output

elif [ $2 == 'Movies' ]
then
	filebot -rename -r "$1" --db TheMovieDB -non-strict --action duplicate --output /mnt/nfs_share/ --format "{plex}" >> $output

elif [ $2 == 'TV Shows' ]
then
	filebot -rename -r "$1" --db TheMovieDB::TV -non-strict --action duplicate --output /mnt/nfs_share/ --format "{plex}" >> $output

else
	echo "Uncategorized File - doing nothing" >> $output

fi

echo '--------------------------------------------------------------------------------------' >> $output
echo >> $output



# old code
# filebot -rename -r "$1" --db TheMovieDB::TV -non-strict --action duplicate --output /mnt/nfs_share/ --format "{plex}" -exec chmod -R 777 "{output}" | tee -a $output
