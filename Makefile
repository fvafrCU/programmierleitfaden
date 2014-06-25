PUBLIC_DIRECTORY=/trans/h/FVA-Projekte/Methodenforum/programmierleitfaden
NAME=programmierleitfaden
.PHONY: all
all: compile 

.PHONY: publish 
publish: update compile 
	cp *.pdf ${PUBLIC_DIRECTORY}
	cp *.R ${PUBLIC_DIRECTORY}
	cp *.c ${PUBLIC_DIRECTORY}
	cp *.java ${PUBLIC_DIRECTORY}
	rm ${PUBLIC_DIRECTORY}/template-*.pdf || true
	cd ${PUBLIC_DIRECTORY} && zip ./${NAME}.zip ./* --exclude ${NAME}.zip

.PHONY: compile
compile: is_roxygenized ${NAME}.pdf 

${NAME}.pdf: vanilla_tex ${NAME}.tex template.pdf 
	texi2pdf --shell-escape  ${NAME}.tex 

${NAME}.html: vanilla_tex  ${NAME}.tex 
	htlatex ${NAME}.tex  "html_css.cfg" "" "" "-interaction=batchmode -shell-escape" 

.PHONY: update
update:
	git commit -am'update' || true
	git checkout master  .

template.pdf: template.Rnw 
	./sweave.R 

.PHONY: is_roxygenized
is_roxygenized: write_readme.pdf 

write_readme.pdf header_roxygen.pdf  roxygen2ForSingleFiles_template.pdf my_r_file.pdf: vanilla_roxygen
	./roxygenize_examples.R

.PHONY: vanilla_tex
vanilla_tex:
	for suffix in aux bbl blg dvi log nav out pdf ps snm toc vrb \
	    ind ilg idx html 4ct 4tc xref tmp lg idv css;\
	do\
	  rm ${NAME}.$${suffix} || true;\
	done
	rm ${NAME}[0-9]*.html || true

.PHONY: vanilla_roxygen
vanilla_roxygen:
	rm header_roxygen.pdf || true
	rm write_readme.pdf || true
	rm roxygen2ForSingleFiles_template.pdf || true
	rm my_r_file.pdf|| true

.PHONY: clean
clean:
	git clean -x -f
