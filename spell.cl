detex -w programmierleitfaden.tex | sort | uniq | spell -D ngerman -
texi2dvi --shell-escape programmierleitfaden.tex && \
    dvips programmierleitfaden.dvi && \
    catdvi programmierleitfaden.dvi | \
    fmt -u | spell -D ngerman - | sort | uniq > tmp.dvi2txt &&
    ps2txt programmierleitfaden.ps | \
    fmt -u | spell -D ngerman - | sort | uniq > tmp.ps2txt


