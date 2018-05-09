FROM jbender/sphinxbase
MAINTAINER Sergey Korol <serhii.s.korol@gmail.com>

ENV SRILM_BASE /srilm

ADD srilm-1.7.2.tar.gz ${SRILM_BASE}/
RUN cd ${SRILM_BASE} && sed -i "s|.*SRILM = .*|SRILM = $SRILM_BASE|" Makefile && make

ENV SRILM_BIN ${SRILM_BASE}/bin/i686-m64
ENV SPHINX_TOOLS /sphinx/sphinxbase/src/sphinx_lmtools
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
