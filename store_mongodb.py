#-*-coding:Latin-1 -*

# SCRIPT PYTHON DECLENCHE PAR SHELL LINUX POUR STOCKAGE DATAS DANS C3

# définir répertoire de stockage des fichiers
import os
os.chdir("/tmp")

import sys

import pymongo
from pymongo import MongoClient

# recup arguments dans commande python
fichier_dicom = sys.argv[1]
ipc3 = '172.17.0.3'

#fichier_dicom ouverture
fichier = open(fichier_dicom, "r")


## PHASE DE TRAITEMENT DES INFOS RECUPEREES
# transformation chaine en liste pour séparer en deux

document1 = fichier_dicom

for ligne in fichier:

    liste = ligne.split(', 1')

    if "StudyInstanceUID" in ligne :
        document2 = liste[0]

    elif "SeriesInstanceUID" in ligne :
        document3 = liste[0]

    elif "SOPInstanceUID" in ligne :
        document4 = liste[0]

    else :
        document2 = document3 = document4 = "empty"


# fermeture fichier
fichier.close()

# MongoDB management

client = MongoClient(ipc3,27017)
bdd = client.herami

collection = bdd.dicom_collection

document_a_inserer = {
    'fichier DICOM': document1,
    'StudyInstanceUID': document2,
    'SeriesInstanceUID': document3,
    'SOPInstanceUID': document4
    }

result = collection.insert_one(document_a_inserer)
print('document: {0}'.format(result.inserted_id))
