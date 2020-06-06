#!/bin/bash

. common.lib

function gen() {
    hugo server --disableFastRender --ignoreCache
}
(
    set -e 
    gen
)
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo -e "${LRED}×  Proses tidak dilanjutkan. Ada yang salah!${CDEF}"
    exit $errorCode
fi