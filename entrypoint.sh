#!/bin/bash
FILE_NAME=$(basename "$1" ".txt")
DIR=$(dirname "$1")
LM_PATH="${DIR}/${FILE_NAME}.lm"
LM_BIN_PATH="${LM_PATH}.bin"

cd "$SRILM_BIN"
./ngram-count -text $1 -lm ${LM_PATH}
cd "$SPHINX_TOOLS"
./sphinx_lm_convert -i ${LM_PATH} -o ${LM_BIN_PATH}
