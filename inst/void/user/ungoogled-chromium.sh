#!/bin/sh

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/'
}

rel=`get_latest_release DAINRA/ungoogled-chromium-void`
file=ungoogled-chromium-`echo $rel | cut -d"v" -f2`.x86_64.xbps
curl -LO https://github.com/DAINRA/ungoogled-chromium-void/releases/download/$rel/$file

command xbps-rindex -a *.xbps
command sudo xbps-install -y -vR $PWD ungoogled-chromium

rm $file
rm *repodata
