WORK_PATH=`dirname $(readlink -f $0)`

cd ${WORK_PATH}/..
sed -i "s/VERSION = lizkes-*/VERSION = lizkes-$1-custom/" Makefile_lizkes
make -j`nproc` --file=Makefile_lizkes CROSS="${WORK_PATH}/mxe/usr/bin/x86_64-w64-mingw32.static.gcc9-" \
BUILD_PREFIX="win64/" CCACHE=0 TILES=1 SOUND=1 RELEASE=1 LOCALIZE=1 LANGUAGES=all LIBBACKTRACE=0 bindist
