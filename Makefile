TMP_DIRECTORY=./tmp
PUBLIC_DIRECTORY=./public

.PHONY: all
all: compile publish

.PHONY: publish 
publish: tmp
	cp -r ${TMP_DIRECTORY} ${PUBLIC_DIRECTORY}

.PHONY: tmp
tmp:
	rm -r  ${TMP_DIRECTORY} || true
	mkdir ${TMP_DIRECTORY} 
	cp *.pdf ${TMP_DIRECTORY}
	cp *html ${TMP_DIRECTORY}
	cp *.R ${TMP_DIRECTORY}
	cp *.c ${TMP_DIRECTORY}
	cp *.java ${TMP_DIRECTORY}
	rm ${TMP_DIRECTORY}/template-*.pdf || true

.PHONY: compile
compile: write_readme.pdf programmierleitfaden.html programmierleitfaden.pdf 

programmierleitfaden.pdf: vanilla_tex programmierleitfaden.tex update
	texi2pdf --shell-escape  programmierleitfaden.tex 

programmierleitfaden.html: programmierleitfaden.tex update
	htlatex programmierleitfaden.tex  "html_css.cfg" "" "" "-interaction=batchmode -shell-escape" 
.PHONY: update
update:
	git add programmierleitfaden.tex && git commit -m'update' || true
	git checkout master programmierleitfaden.tex || true # for push and deploy there can't be a checkout

template.pdf: template.Rnw 
	./sweave.R 

write_readme.pdf: vanilla_roxygen
	./roxygenize_examples.R

.PHONY: vanilla_tex
vanilla_tex:
	rm programmierleitfaden.aux || true

.PHONY: vanilla_roxygen
vanilla_roxygen:
	rm r_roxygen.pdf || true
	rm write_readme.pdf || true
	rm roxygen2ForSingleFiles_template.pdf || true
	rm my_r_file.pdf|| true

