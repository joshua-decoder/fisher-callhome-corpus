The Fisher and CALLHOME Spanish--English Speech Translation Corpus
==================================================================

The Fisher and CALLHOME Spanish--English Speech Translation Corpus contains English reference
translations and speech recognizer output (in various forms) that complement the LDC Fisher and
CALLHOME Spanish audio and transcripts. Together, they make a four-way parallel dataset whose goal
is to further research in Spanish--English speech translation.

For a complete description of this corpus, and for citation in your own published research, please
cite the following paper. A copy can be found in the doc/ directory.

    @inproceedings{post2013improved,
      Title = {Improved Speech-to-Text Translation with the {F}isher and {C}allhome {S}panish--{E}nglish Speech Translation Corpus},
      Author = {Post, Matt and Kumar, Gaurav and Lopez, Adam and Karakos, Damianos and Callison-Burch, Chris and Khudanpur, Sanjeev},
      Booktitle = {Proceedings of the International Workshop on Spoken Language Translation (IWSLT)},
      Year = {2013},
      Address = {Heidelberg, Germany},
      Month = {December}
    }

The `mapping/` direocty contains files corresponding to our data splits. Each line in these files
contains a reference to the LDC transcript file and line numbers.

The `corpus/` directory houses the various pieces of the corpus. Each subdirectory contains (a) a
single Spanish side and (b) either one (for Fisher training and all CALLHOME data) or four (for
Fisher test sets) English references. The Spanish side always has the extension ".es", and varies
among (a) LDC transcript (b) Kaldi ASR output (c) Kaldi lattice output and (d) lattice oracle paths.
                                         
Due to licensing restrictions, we cannot include the LDC Spanish transcripts with this dataset. We
have, however, provided scripts that will construct our data splits. To build these, run:

    ./bin/build_fisher.sh <[LDC2010T04](http://catalog.ldc.upenn.edu/LDC2010T04) directory>
    ./bin/build_callhome.sh <[LDC96T17](http://catalog.ldc.upenn.edu/LDC96T17) directory>

If you define the environment variables `$LDC2010T04` and `$LDC96T17` to point to these directories,
you can simply type `make`. Either way, you should end up with the following files:

    corpus/ldc/fisher_train.es
    corpus/ldc/fisher_dev.es
    corpus/ldc/fisher_dev2.es
    corpus/ldc/fisher_test.es
    corpus/ldc/callhome_train.es
    corpus/ldc/callhome_devtest.es
    corpus/ldc/callhome_evltest.es
