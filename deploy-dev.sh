#!/bin/bash

. common.lib

DEPLF="Firebase"
NAMA_PROJECT="cortana"
DEPLV="Vercel"

echo -e "${LCYAN}»  Membuat file static..${CDEF}"
hugo --ignoreCache && sleep 1
f1baris
echo "» Push updates to GIT.."
git add . && sleep 1
echo "Apa yang diubah kali ini?"
read -r GIT_COMMENT && sleep 1
git commit -am "${GIT_COMMENT}" && sleep 1
# git push -u origin master && sleep 1
# printf "\n"
echo -e "${LCYAN}»  Deploy ke ${DEPLF}..${CDEF}"
function flfirebase() {
   firebase login
}
function ffirebase() {
   firebase deploy --only hosting:${NAMA_PROJECT}
}
(
   set -e 
   flfirebase
   ffirebase
)
errorCode=$?
if [ $errorCode -ne 0 ]; then
   echo -e "${LRED}×  Proses deploy ke ${DEPLF} tidak dilanjutkan. Ada yang salah!${CDEF}"
   $errorCode
fi
echo -e "${LCYAN}»  Deploy ke ${DEPLV}..${CDEF}"
function flnow() {
    vercel login
}
function fnow() {
    vercel --prod
}
(
    set -e 
    #flnow
    fnow
)
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo -e "${LRED}×  Proses deploy ke ${DEPLV} tidak dilanjutkan. Ada yang salah!${CDEF}"
    exit $errorCode
fi
f1baris && fselesai && f1baris