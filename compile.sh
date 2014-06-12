rm r_roxygen.pdf
rm write_readme.pdf
rm roxygen2ForSingleFiles_template.pdf my_r_file.pdf
./roxygenize_examples.R && ./sweave.R && \
    htlatex programmierleitfaden.tex  "html_css.cfg" "" "" "-interaction=batchmode -shell-escape"  && \
    latex.clean.cl programmierleitfaden.tex && \
    texi2pdf --shell-escape  programmierleitfaden.tex 


