WORK_PATH=`dirname $(readlink -f $0)`
VERSION=lizkes-$1-pure

# rm ${WORK_PATH}/app/build/outputs/apk/experimental/release/* ${WORK_PATH}/cdda-*-pure-arm32.apk ${WORK_PATH}/cdda-*-pure-arm64.apk
./gradlew assembleExperimentalRelease -Pj=`nproc` -Pabi_arm_32=true -Pabi_arm_64=true -Poverride_version=${VERSION}
mv ${WORK_PATH}/app/build/outputs/apk/experimental/release/cataclysmdda-${VERSION}-experimental-armeabi-v7a-release-unsigned.apk ${WORK_PATH}/cdda-${VERSION}-arm32.apk
mv ${WORK_PATH}/app/build/outputs/apk/experimental/release/cataclysmdda-${VERSION}-experimental-arm64-v8a-release-unsigned.apk ${WORK_PATH}/cdda-${VERSION}-arm64.apk
jarsigner -sigalg SHA1withRSA -digestalg SHA1 -keystore "lizkes.keystore" -storepass "cdda-lizkes" ${WORK_PATH}/cdda-${VERSION}-arm32.apk app
jarsigner -sigalg SHA1withRSA -digestalg SHA1 -keystore "lizkes.keystore" -storepass "cdda-lizkes" ${WORK_PATH}/cdda-${VERSION}-arm64.apk app
