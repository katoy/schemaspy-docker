FROM schemaspy/schemaspy:snapshot
USER root
WORKDIR /
RUN apk update && \
    apk add --no-cache curl fontconfig && \
    mkdir download && \
    cd download && \
    curl -O https://moji.or.jp/wp-content/ipafont/IPAexfont/IPAexfont00401.zip && \    
    unzip IPAexfont00401.zip && \
    mkdir -p /usr/share/fonts/truetype/ipa && \
    cp */*ttf /usr/share/fonts/truetype/ipa && \
    fc-cache -fv && \
    rm -rf download
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
