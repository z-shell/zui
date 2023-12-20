all: adoc clean

%.zwc: %
	@lib/zcompile.zsh $<

adoc: lib/stdlib.lzui.zwc lib/syslib.lzui.zwc lib/utillib.lzui.zwc
	@zsd -v --scomm \
	--cignore '(\#[[:blank:]]FUN(C|CTION|):[[:blank:]]*[[:blank:]]{{{*|[[:blank:]]\#[[:blank:]]}}}*)' \
	lib/*.lzui
	@cp -f zsdoc/*.adoc docs/

html:
	@asciidoctor zsdoc/*.lzui.adoc

clean:
	@rm -rf zsdoc
	@rm -rf lib/*.zwc
