#!/bin/bash

# create DICOM list file first
ls /Hera-Mi_STORE_C2 > /tmp/listdicom

# DICOM files dump one by one and Python treatment
cat /tmp/listdicom | while read fichier ; do

       /usr/bin/python3.8 /tmp/store_mongodb.py /Hera-Mi_STORE_C2/$fichier
done

# deletion of DICOM list file
rm /tmp/listdicom

echo "------------------------------------------------------------"
echo "DICOM files selected fields stored in C3 MongoDB container !"

