PUBLIC_DIRECTORY=/trans/h/FVA-Projekte/Methodenforum/programmierleitfaden
NAME=programmierleitfaden
version=$$(cat VERSION)
.PHONY: all
all: compile 

.PHONY: publish 
publish: update compile test_listings 
	cp *.pdf ${PUBLIC_DIRECTORY}
	cp -r listings/ ${PUBLIC_DIRECTORY}
	rm ${PUBLIC_DIRECTORY}/template-*.pdf || true
	cd ${PUBLIC_DIRECTORY} && zip ./${NAME}.zip ./* --exclude ${NAME}.zip



.PHONY: compile
compile: is_roxygenized ${NAME}.pdf 

.PHONY: ${NAME}.pdf
${NAME}.pdf: vanilla_tex ${NAME}.tex template.pdf gittag
	texi2pdf --shell-escape  ${NAME}.tex 

${NAME}.html: vanilla_tex  ${NAME}.tex 
	htlatex ${NAME}.tex  "html_css.cfg" "" "" "-interaction=batchmode -shell-escape" 

.PHONY: update
update:
	git commit -am'update' || true
	git checkout master  .

.PHONY: template.pdf
template.pdf: listings/template.Rnw 
	./sweave.r listings/template.Rnw 

.PHONY: is_roxygenized
is_roxygenized: write_readme.pdf 

.PHONY: write_readme.pdf
write_readme.pdf header_roxygen.pdf  roxygen2ForSingleFiles_template.pdf my_r_file.pdf: vanilla_roxygen
	cd listings && ./documentation_examples.r && mv *pdf ../

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

.PHONY: test_listings
test_listings: test_listings_R test_listings_C
.PHONY: test_listings_R
test_listings_R: 
	./test_listings_R.cl
.PHONY: test_listings_C
test_listings_C: 
	./test_listings_C.cl


.PHONY: gittag
gittag:
	git tag -l | grep ${version} ||  eval git tag -a v${version}
.PHONY: clean
clean:
	git clean -x -f
