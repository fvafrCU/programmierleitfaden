PUBLIC_DIRECTORY=/trans/h/FVA-Projekte/Methodenforum/programmierleitfaden

.PHONY: all
all: compile 

.PHONY: publish 
publish: update compile 
	rm -r  ${PUBLIC_DIRECTORY} || true
	mkdir ${PUBLIC_DIRECTORY} 
	cp *.pdf ${PUBLIC_DIRECTORY}
	cp *html ${PUBLIC_DIRECTORY}
	cp *.R ${PUBLIC_DIRECTORY}
	cp *.c ${PUBLIC_DIRECTORY}
	cp *.java ${PUBLIC_DIRECTORY}
	rm ${PUBLIC_DIRECTORY}/template-*.pdf || true

.PHONY: compile
compile: write_readme.pdf programmierleitfaden.html programmierleitfaden.pdf 

programmierleitfaden.pdf: vanilla_tex programmierleitfaden.tex template.pdf 
	texi2pdf --shell-escape  programmierleitfaden.tex 

programmierleitfaden.html: programmierleitfaden.tex 
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

