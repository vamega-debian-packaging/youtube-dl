#/bin/bash

source meta.sh

set -x

curl -o youtube-dl -L -J "${DOWNLOAD_URL}"
chmod 755 youtube-dl

fpm -s dir \
    -t deb \
    --description "${DESCRIPTION}" \
    --url "${WEBSITE_URL}" \
    -m "${MAINTAINER}" \
    -n "${PACKAGE_NAME}" \
    -v "${VERSION}" \
    --iteration 1 \
    'youtube-dl=/usr/bin/youtube-dl'

dpkg-deb --info *.deb
dpkg-deb -c *.deb

jfrog bt upload \
      --deb stretch/main/amd64 \
      --publish \
      *.deb "${REPO}/${VERSION}"

