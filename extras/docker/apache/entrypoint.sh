#!/bin/sh

/home/wger/venvwrapper migrate

if [ "${DOWNLOAD_IMGS}" = "TRUE" ]; then
  curl https://mock-wger.peshak.net/exercise-images.tar.xz | tar -C ~wger/media -Jvxf -
  chmod -R g+w ~wger/media
fi

if [ "${USE_S3}" = "TRUE" ]; then
  /home/wger/venvwrapper collectstatic --no-input
  /home/wger/venvwrapper compress --force
fi

/usr/sbin/apache2ctl -D FOREGROUND
