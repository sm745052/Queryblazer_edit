set -e

# INPUT
LOG_FILE=data/DDC/test_formatted.txt

# OUTPUT FILES; will overwrite
OUTPUT_DIR=experiments/
LOG_ENCODED=$OUTPUT_DIR/train.enc
SPM_PREFIX=$OUTPUT_DIR/subword # $SPM_PREFIX.{m, vocab}
ENCODER=$OUTPUT_DIR/encoder.fst
LANGUAGE_MODEL=$OUTPUT_DIR/ngram # $LANGUAGE_MODEL.{arpa, fst}
PRECOMPUTED=$OUTPUT_DIR/precomputed.bin

# CONFIG
SPM_MODEL=bpe # char, bpe, unigram
SPM_VOCAB_SIZE=4096
SPM_CHARACTER_COVERAGE=0.9995
LM_ORDER=8
LM_PRUNE="--prune 0 1 1 2 2 3 3 4"

mkdir -p $OUTPUT_DIR
# OUTPUT_DIR=data/DSTC7/bpe/4096
# python3 script/extract_prefix.py --n 57 < $LOG_FILE > $OUTPUT_DIR/test.prefix
python3 script/complete.py --encoder $ENCODER --model $LANGUAGE_MODEL.fst --precomputed $PRECOMPUTED < $LOG_FILE > $OUTPUT_DIR/test.complete
