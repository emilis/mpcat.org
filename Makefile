### Variables ------------------------------------------------------------------

SRC =			lib
MAIN =			index.mpc
SRC_FILES =		$(shell find $(SRC) -type f)
ALL_FILES =		Makefile $(MAIN) $(SRC_FILES)
LRSYNC =		rsync -ghlport --del
RRSYNC =		rsync -hlprt --del

### Tasks ----------------------------------------------------------------------

.PHONY = default
default:\
	build/.htaccess\
	build/index.html\
	build/style.css\
	build/script.js\
	build/pages\


.PHONY += sync-static
sync-static:\

	$(LRSYNC) static/ build/static/


.PHONY += clean
clean:\

	rm -rf build/*


.PHONY += backup
backup:\

	git push pi master


.PHONY += deploy
deploy:\

	$(RRSYNC) build/ mpcat@mpcat.org:mpcat.org/


.PHONY += redeploy
redeploy:\
	clean\
	default\
	sync-static\
	deploy\

### Targets --------------------------------------------------------------------

build/.htaccess:\
	.htaccess\

	cp "$^" "$@"


build/index.html:\
	$(ALL_FILES)\

	stark


build/style.css:\
	$(ALL_FILES)\

	stark


build/script.js:\
	$(ALL_FILES)\

	stark


build/pages:\
	pages\

	stark
