PREFIX=/usr/local
NAME_PREFIX=
SHARED=/usr/local/share/utils

SCRIPTS=\
        update-global-ctags\
        attach-displays\
        backlight\
        bu\
        clean\
        def\
        do-each\
        dyninput\
        extract\
        get-packages\
        git-du\
        git-perm-rm\
        gits\
        grade\
        growth\
        last-used\
        latexize\
        low-power\
        nf\
        note\
        pdf\
        rot13\
        rs-parallel\
        run-always\
        run-java\
        seq-rename\
        th\
        translate\
        weagle\
        dirty\
        split-args\
        du-sorted\
        d\
        qnmap\
        arp-ips\
        git-wc\
        splitter\
        qln\
        drive-dump\
        dm\
        git-remote-mod-url\
		  viname\
		  vimv\
		  sec-check\
		  get-script-dependencies\
		  todos\
		  clean-text\
		  ext/google-contacts-lookup\
		  rotate-dir\
		  crypt\
		  pkglist\
		  baseconv\
		  vol\

.PHONY:
.SILENT:

all: check

check:
	for script in ${SCRIPTS} ; do \
		if ! diff -q "$$script" "${DESTDIR}${PREFIX}/bin/${NAME_PREFIX}$$script" &> /dev/null ; then\
			echo "'$$script' has changes" ; \
		fi \
	done

install:
	install -D common.sh ${SHARED}/common.sh ; \
	for script in ${SCRIPTS} ; do \
		install_location="${DESTDIR}${PREFIX}/bin/${NAME_PREFIX}$$(basename $$script)" ; \
		install "$$script" $$install_location ; \
		sed -i '/UTILS_SHARED/i\UTILS_SHARED=${SHARED}' $$install_location ; \
	done

uninstall:
	for script in ${SCRIPTS} ; do \
		rm -vf ${DESTDIR}${PREFIX}/bin/$$script ; \
	done
