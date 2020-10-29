#!/bin/sh
# Download 2WikiMultihop Data
wget https://www.dropbox.com/s/npidmtadreo6df2/data.zip


# Download GloVe
GLOVE_DIR=./
mkdir -p $GLOVE_DIR
wget http://nlp.stanford.edu/data/glove.840B.300d.zip -O $GLOVE_DIR/glove.840B.300d.zip
unzip $GLOVE_DIR/glove.840B.300d.zip -d $GLOVE_DIR

# Download Spacy language models
python3 -m spacy download en