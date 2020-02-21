#!/bin/bash

if [[ -d "${1}" ]];then
  SUBFILES=$(find "${1}" | wc -l);
  WARNMSG="WARNING: The will perform the forensic and irreversible removal of ${1} and all ${SUBFILES} sub files and folders.";
else
  WARNMSG="WARNING: This will perform the forensic and irreversible removal of file ${1}.";
fi

echo ""
echo "${WARNMSG}";
echo "";
echo "     ***** CHOOSE YOUR DESTROYER *****";
echo "[1] Shredder (US DoD compliant 7-pass overwrite)";
echo "[2] SUPER Shredder (Gutmann 35-pass overwrite)";
read -p "Enter option [1,2] (press any other key to cancel): " LVL

if [ -z ${1} ]; then
  DIR="./";
else
  DIR="${1}";
fi;

if [[ "${LVL}" -eq 1 ]];then
  echo "Forcing recurisve deletion of ${DIR} using 7-pass Department of Defense method..";
  sudo srm -rfv --dod ${DIR};
  echo "Done! ";
elif [[ "${LVL}" -eq 2 ]];then
  echo "Forcing recurisve deletion of ${DIR} using deleting using 35-pass Gutmann Method..";
  sudo srm -rfv --gutmann ${DIR};
  echo "Done! ";
  else
    echo 'Secure deletion canceled.';
fi



