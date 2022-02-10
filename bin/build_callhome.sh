#!/bin/bash
die () {
  echo >&2 "$@"
  exit 1
}
[ "$#" -eq 1 ] || die "Usage: $0 <LDC96T17 directory>"
[ -d $1 ] || die "Could not find directory $1"
[ -d "$1/transcrp" ] || die "Directory $1 does not appear to be LDC96T17"
BINDIR=`dirname $0`
TARGETDIR="`dirname $0`/../corpus/ldc"

for C in $(cd mapping; ls callhome*); do
  for F in $(cat mapping/$C | cut -d' ' -f1 | uniq); do
    echo "## FILE $F"
    cat $1/transcrp/*/$F.txt | 
    iconv -f iso8859-1 -t utf-8 | 
    cut -f 4- -d \ | 
    $BINDIR/strip_markup.pl 
  done | $BINDIR/map_transcription.py mapping/$C > $TARGETDIR/$C.es
done 

