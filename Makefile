# TODO: learn how to use make loops

PREFIX = /usr/local

all:

install:
	@install -v update-global-ctags ${DESTDIR}${PREFIX}/bin
	@install -v attach-displays ${DESTDIR}${PREFIX}/bin
	@install -v backlight ${DESTDIR}${PREFIX}/bin
	@install -v bu ${DESTDIR}${PREFIX}/bin
	@install -v ciph ${DESTDIR}${PREFIX}/bin
	@install -v clean ${DESTDIR}${PREFIX}/bin
	@install -v def ${DESTDIR}${PREFIX}/bin
	@install -v do-each ${DESTDIR}${PREFIX}/bin
	@install -v dyninput ${DESTDIR}${PREFIX}/bin
	@install -v extract ${DESTDIR}${PREFIX}/bin
	@install -v full-backup ${DESTDIR}${PREFIX}/bin
	@install -v get-packages ${DESTDIR}${PREFIX}/bin
	@install -v git-du ${DESTDIR}${PREFIX}/bin
	@install -v git-perm-rm ${DESTDIR}${PREFIX}/bin
	@install -v grade ${DESTDIR}${PREFIX}/bin
	@install -v growth ${DESTDIR}${PREFIX}/bin
	@install -v last-used ${DESTDIR}${PREFIX}/bin
	@install -v latexize ${DESTDIR}${PREFIX}/bin
	@install -v low-power ${DESTDIR}${PREFIX}/bin
	@install -v nf ${DESTDIR}${PREFIX}/bin
	@install -v note ${DESTDIR}${PREFIX}/bin
	@install -v pdf ${DESTDIR}${PREFIX}/bin
	@install -v rep ${DESTDIR}${PREFIX}/bin
	@install -v rot13 ${DESTDIR}${PREFIX}/bin
	@install -v rs-parallel ${DESTDIR}${PREFIX}/bin
	@install -v run-always ${DESTDIR}${PREFIX}/bin
	@install -v run-java.sh ${DESTDIR}${PREFIX}/bin
	@install -v seq-rename ${DESTDIR}${PREFIX}/bin
	@install -v th ${DESTDIR}${PREFIX}/bin
	@install -v th-clear ${DESTDIR}${PREFIX}/bin
	@install -v th-ls ${DESTDIR}${PREFIX}/bin
	@install -v th-undo ${DESTDIR}${PREFIX}/bin
	@install -v translate ${DESTDIR}${PREFIX}/bin
	@install -v weagle ${DESTDIR}${PREFIX}/bin
	@install -v dirty ${DESTDIR}${PREFIX}/bin
	@install -v split-args ${DESTDIR}${PREFIX}/bin

uninstall:
	@rm -f ${DESTDIR}${PREFIX}/bin/attach-displays
	@rm -f ${DESTDIR}${PREFIX}/bin/backlight
	@rm -f ${DESTDIR}${PREFIX}/bin/bu
	@rm -f ${DESTDIR}${PREFIX}/bin/ciph
	@rm -f ${DESTDIR}${PREFIX}/bin/clean
	@rm -f ${DESTDIR}${PREFIX}/bin/def
	@rm -f ${DESTDIR}${PREFIX}/bin/do-each
	@rm -f ${DESTDIR}${PREFIX}/bin/dyninput
	@rm -f ${DESTDIR}${PREFIX}/bin/extract
	@rm -f ${DESTDIR}${PREFIX}/bin/full-backup
	@rm -f ${DESTDIR}${PREFIX}/bin/get-packages
	@rm -f ${DESTDIR}${PREFIX}/bin/git-du
	@rm -f ${DESTDIR}${PREFIX}/bin/git-perm-rm
	@rm -f ${DESTDIR}${PREFIX}/bin/grade
	@rm -f ${DESTDIR}${PREFIX}/bin/growth
	@rm -f ${DESTDIR}${PREFIX}/bin/last-used
	@rm -f ${DESTDIR}${PREFIX}/bin/latexize
	@rm -f ${DESTDIR}${PREFIX}/bin/low-power
	@rm -f ${DESTDIR}${PREFIX}/bin/nf
	@rm -f ${DESTDIR}${PREFIX}/bin/note
	@rm -f ${DESTDIR}${PREFIX}/bin/pdf
	@rm -f ${DESTDIR}${PREFIX}/bin/rep
	@rm -f ${DESTDIR}${PREFIX}/bin/rot13
	@rm -f ${DESTDIR}${PREFIX}/bin/rs-parallel
	@rm -f ${DESTDIR}${PREFIX}/bin/run-always
	@rm -f ${DESTDIR}${PREFIX}/bin/run-java.sh
	@rm -f ${DESTDIR}${PREFIX}/bin/seq-rename
	@rm -f ${DESTDIR}${PREFIX}/bin/th
	@rm -f ${DESTDIR}${PREFIX}/bin/th-clear
	@rm -f ${DESTDIR}${PREFIX}/bin/th-ls
	@rm -f ${DESTDIR}${PREFIX}/bin/th-undo
	@rm -f ${DESTDIR}${PREFIX}/bin/translate
	@rm -f ${DESTDIR}${PREFIX}/bin/update-global-ctags
	@rm -f ${DESTDIR}${PREFIX}/bin/weagle
	@rm -f ${DESTDIR}${PREFIX}/bin/dirty
	@rm -f ${DESTDIR}${PREFIX}/bin/split-args
