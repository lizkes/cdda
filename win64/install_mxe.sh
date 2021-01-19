WORK_PATH=`dirname $(readlink -f $0)`

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf automake autopoint bash bison bzip2 flex g++ g++-multilib \
    gettext git gperf intltool libc6-dev-i386 libgdk-pixbuf2.0-dev libltdl-dev libssl-dev libtool-bin libxml-parser-perl \
    lzip make openssl p7zip-full patch perl python ruby sed unzip wget xz-utils

git clone https://github.com/mxe/mxe.git ${WORK_PATH}/mxe
cd ${WORK_PATH}/mxe
make -j`nproc` MXE_TARGETS='x86_64-w64-mingw32.static.gcc9' sdl2 sdl2_ttf sdl2_image sdl2_mixer gettext
