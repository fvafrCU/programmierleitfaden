PUBLIC_DIRECTORY=/trans/h/FVA-Projekte/Methodenforum/programmierleitfaden
NAME=programmierleitfaden
version=$$(cat VERSION)
.PHONY: all
all: compile 

.PHONY: publish 
publish: update compile gittag  
	cp *.pdf ${PUBLIC_DIRECTORY}
	cp -r listings/ ${PUBLIC_DIRECTORY}
	rm ${PUBLIC_DIRECTORY}/template-*.pdf || true
	cd ${PUBLIC_DIRECTORY} && zip ./${NAME}.zip ./* --exclude ${NAME}.zip

.PHONY: compile 
compile: write_readme.pdf header_roxygen.pdf ${NAME}.pdf  test_listings cleanr lintr template.pdf 

${NAME}.pdf: ${NAME}.ps
	ps2pdf ${NAME}.ps

.PHONY: gittag
gittag: ${NAME}.ps 
	if git status --porcelain | grep "^ M" > /dev/null; then printf "found uncommitted changes.\n"; exit 1; fi
	git tag -l | grep ${version} ||  eval git tag -a v${version}

${NAME}.ps: ${NAME}.tex  VERSION 
	texi2dvi --shell-escape  ${NAME}.tex && dvips ${NAME}.dvi

.PHONY: update
update:
	git commit -am'update' || true
	git checkout master  .

template.pdf: listings/template.Rnw 
	./sweave.r listings/template.Rnw 

write_readme.pdf header_roxygen.pdf: vanilla_roxygen
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
	rm my_r_file.pdf|| true

.PHONY: cleanr
	./cleanr.r
.PHONY: lintr
	./lintr.r

.PHONY: test_listings
test_listings: test_listings_R test_listings_C

.PHONY: test_listings_R
test_listings_R: 
	./test_listings_R.cl

.PHONY: test_listings_C
test_listings_C: 
	./test_listings_C.cl

.PHONY: clean
clean:
	git clean -x -f
