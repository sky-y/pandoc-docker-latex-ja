ARG base_tag="latest"
FROM pandoc/latex:${base_tag}

LABEL maintainer "sky-y <sky.y.0079@gmail.com>"

ENV HARANOAJI_VERSION=20190824

WORKDIR /root

# Install basic dependencies
# Ref: https://github.com/y-yu/new-year-letter/blob/master/docker/Dockerfile
RUN apk upgrade --update && \
    apk add --no-cache --virtual .persistent-deps \
      ca-certificates \
      git \
      make

# Install HaranoAji font (原ノ味フォント)
# (TEXMFLOCAL: /opt/texlive/texmf-local)
RUN wget https://github.com/trueroad/HaranoAjiFonts/archive/${HARANOAJI_VERSION}.tar.gz && \
    tar xzvf ${HARANOAJI_VERSION}.tar.gz && \
    mkdir -p $(kpsewhich --var-value=TEXMFLOCAL)/fonts/opentype/public/haranoaji/ && \
    cp HaranoAjiFonts-${HARANOAJI_VERSION}/*.otf $(kpsewhich --var-value=TEXMFLOCAL)/fonts/opentype/public/haranoaji/ && \
    mktexlsr && \
    rm -rf HaranoAjiFonts-${HARANOAJI_VERSION} ${HARANOAJI_VERSION}.tar.gz

# Install TeXLive
# Ref: https://github.com/y-yu/new-year-letter/blob/master/docker/Dockerfile
# (Note: LuaTeX-ja requires everyhook and svn-prov)
RUN tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet && \
    tlmgr install \
      latexmk \
      collection-langjapanese  \
      collection-fontsrecommended \
      everyhook \
      svn-prov

VOLUME [ "/data" ]
WORKDIR /data

ENTRYPOINT [ "docker-entrypoint.sh" ]
