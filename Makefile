SHELL := /bin/bash

.PHONY: init-review-jlreq
init-review-jlreq:
	# TODO: https://github.com/kmuto/review/archive/v4.0.0.tar.gz
	# から review-jlreq を抜き出してTEXMFHOMEにデプロイする
	mkdir -p $(kpsewhich -var-value TEXMFHOME)/tex/latex
