#!/bin/bash

# create DICOM list file first
ls /Hera-Mi_STORE_C2 > /tmp/listdicom

# DICOM files dump one by one
cat /tmp/listdicom | while read fichier ; do

        dcmdump /Hera-Mi_STORE_C2/$fichier > $fichier".txt"
done

# moove all decoded files to /Hera-Mi_STORE_C2
mv /tmp/*.txt /Hera-Mi_STORE_C2/

# deletion of DICOM list file
rm /tmp/listdicom

echo "-------------------------------------"
echo "DICOM files decoded : "

ls -l /Hera-Mi_STORE_C2/*.txt
