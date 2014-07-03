DIR_BUILD := _obuild

MAX_BUILD_WORKERS := \
	$(shell nproc             2> /dev/null \
	     || gnproc            2> /dev/null \
	     || sysctl -n hw.ncpu 2> /dev/null \
	 )


.PHONY: \
	build \
	clean \
	clean_manually


build: ocp-build.root
	@ocp-build build -njobs $(MAX_BUILD_WORKERS)

ocp-build.root:
	@ocp-build -init -njobs $(MAX_BUILD_WORKERS)

clean:
	@ocp-build clean
	@rm -f ocp-build.root*

clean_manually: clean_bin
	@find \
		. \
			-name '*.o' \
		-or -name '*.cmi' \
		-or -name '*.cmo' \
		-or -name '*.cmx' \
	| xargs rm -f
