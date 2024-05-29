#!/bin/bash
spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}
#Insert interactive shell here
echo "Updating Wine..."
spin &
SPIN_PID=$!
trap "kill -9 $SPIN_PID" `seq 0 15`
{
sudo apt update
sudo apt upgrade alsa-topology-conf alsa-ucm-conf cabextract fuseiso \
 gstreamer1.0-plugins-base gstreamer1.0-plugins-base:i386 i965-va-driver \
 i965-va-driver:i386 intel-media-va-driver intel-media-va-driver:i386 libaom3:i386 libapparmor1:i386 \
 libasound2 libasound2:i386 libasound2-data libasound2-plugins libasound2-plugins:i386 libasyncns0 \
 libasyncns0:i386 libatomic1:i386 libavahi-client3:i386 libavahi-common-data:i386 libavahi-common3:i386 \
 libavcodec59 libavcodec59:i386 libavutil57 libavutil57:i386 libbrotli1:i386 libbsd0:i386 libcairo-gobject2:i386 \
 libcairo2:i386 libcapi20-3 libcapi20-3:i386 libcdparanoia0 libcdparanoia0:i386 libcodec2-1.0 \
 libcodec2-1.0:i386 libcups2:i386 libcurl3-gnutls:i386 libcurl4:i386 libdatrie1:i386 libdav1d6:i386 \ 
 libdbus-1-3:i386 libdecor-0-0 libdecor-0-0:i386 libdecor-0-plugin-1-cairo libdecor-0-plugin-1-cairo:i386 libdeflate0:i386 \
 libdrm-amdgpu1:i386 libdrm-intel1:i386 libdrm-nouveau2:i386 libdrm-radeon1:i386 libdrm2:i386 libdw1:i386  \
 libedit2:i386 libelf1:i386 libexif12:i386 libexpat1:i386 libffi8:i386 libflac8 libflac8:i386 \
 libfontconfig1:i386 libfreetype6:i386 libfribidi0:i386 libfuse2 libgbm1 libgbm1:i386 libgd3:i386 \
 libgdbm-compat4:i386 libgdbm6:i386 libgdk-pixbuf-2.0-0:i386 libglapi-mesa:i386 libglib2.0-0:i386 libglu1-mesa \
 libglu1-mesa:i386 libglvnd0:i386 libgnutls30:i386 libgomp1:i386 libgphoto2-6:i386 libgphoto2-port12:i386 libgraphite2-3:i386 \
 libgsm1 libgsm1:i386 libgstreamer-plugins-base1.0-0 libgstreamer-plugins-base1.0-0:i386 libgstreamer1.0-0:i386 \
 libharfbuzz0b:i386 libhogweed6:i386 libicu71:i386 libieee1284-3:i386 libigdgmm12 libigdgmm12:i386 libjack-jackd2-0 \
 libjack-jackd2-0:i386 libjbig0:i386 libjpeg-turbo8:i386 libjpeg8:i386 liblcms2-2:i386 libldap-2.5-0:i386 \
 libllvm15:i386 libltdl7:i386 libmd0:i386 libmfx1 libmp3lame0 libmp3lame0:i386 libnettle8:i386 libnghttp2-14:i386 \
 libnspr4:i386 libnss3:i386 libnuma1:i386 libodbc1 libodbc1:i386 libodbc2 libodbc2:i386 libodbccr2 libodbccr2:i386 \
 libogg0 libogg0:i386 libopengl0 libopengl0:i386 libopenjp2-7:i386 libopus0 libopus0:i386 liborc-0.4-0 \
 liborc-0.4-0:i386 libosmesa6 libosmesa6:i386 libp11-kit0:i386 libpango-1.0-0:i386 libpangocairo-1.0-0:i386 \
 libpangoft2-1.0-0:i386 libpcap0.8:i386 libpci3:i386 libpciaccess0:i386 libperl5.34:i386 libpixman-1-0:i386 \
 libpng16-16:i386 libpoppler-glib8:i386 libpoppler123:i386 libpsl5:i386 libpulse0 libpulse0:i386 librsvg2-2:i386 \
 librsvg2-common:i386 librtmp1:i386 libsamplerate0 libsamplerate0:i386 libsane1:i386 libsasl2-2:i386 libsasl2-modules:i386 \
 libsasl2-modules-db:i386 libsdl2-2.0-0 libsdl2-2.0-0:i386 libsensors5:i386 libshine3 libshine3:i386 libsnappy1v5 libsnappy1v5:i386 \
 libsndfile1 libsndfile1:i386 libsnmp40:i386 libsoxr0 libsoxr0:i386 libspeex1 libspeex1:i386 libspeexdsp1 libspeexdsp1:i386 libsqlite3-0:i386 \
 libssh-4:i386 libstdc++6:i386 libsvtav1enc1 libsvtav1enc1:i386 libswresample4 libswresample4:i386 libtasn1-6:i386 libthai0:i386 libtheora0 \
 libtheora0:i386 libtiff5:i386 libtwolame0 libtwolame0:i386 libunwind8:i386 libusb-1.0-0:i386 libv4l-0 libv4l-0:i386 libv4lconvert0 libv4lconvert0:i386 \
 libva-drm2 libva-drm2:i386 libva-x11-2 libva-x11-2:i386 libva2 libva2:i386 libvdpau1 libvdpau1:i386 libvisual-0.4-0 libvisual-0.4-0:i386 libvorbis0a libvorbis0a:i386 libvorbisenc2 libvorbisenc2:i386 libvpx7 libvpx7:i386 \
 libwayland-client0:i386 libwayland-cursor0:i386 libwayland-egl1:i386 libwayland-server0 libwayland-server0:i386 libwebp7:i386 libwebpmux3:i386 \
 libwrap0:i386 libx11-6:i386 libx11-xcb1:i386 libx264-164 libx264-164:i386 libx265-199:i386 libxau6:i386 libxcb-dri2-0:i386 libxcb-dri3-0:i386 libxcb-present0:i386 libxcb-render0:i386 libxcb-shm0:i386 \
 libxcb-sync1:i386 libxcb-xfixes0:i386 libxcb1:i386 libxcomposite1:i386 libxcursor1:i386 libxdmcp6:i386 \
 libxext6:i386 libxfixes3:i386 libxi6:i386 libxinerama1:i386 libxkbcommon0:i386 libxml2:i386 libxpm4:i386 libxrandr2:i386 libxrender1:i386 \
 libxshmfence1:i386 libxslt1.1:i386 libxss1 libxss1:i386 libxvidcore4 libxvidcore4:i386 libxxf86vm1:i386 libzvbi-common libzvbi0 libzvbi0:i386 \
 mesa-va-drivers mesa-va-drivers:i386 mesa-vdpau-drivers mesa-vdpau-drivers:i386 ocl-icd-libopencl1 ocl-icd-libopencl1:i386 p7zip p7zip-full unzip va-driver-all va-driver-all:i386 vdpau-driver-all vdpau-driver-all:i386 wine-stable wine-stable-amd64 wine-stable-i386:i386 gvfs \
 gvfs:i386 i965-va-driver-shaders i965-va-driver-shaders:i386 alsa-utils libcuda1 libnvcuvid1 libnvidia-encode1 libcuda1:i386 libnvcuvid1:i386 libnvidia-encode1:i386 cups-common:i386 \
 libgd-tools:i386 gdbm-l10n:i386 gnutls-bin:i386 gphoto2:i386 libvisual-0.4-plugins libvisual-0.4-plugins:i386 gstreamer1.0-tools:i386 jackd2 jackd2:i386 liblcms2-utils:i386 odbc-postgresql tdsodbc odbc-postgresql:i386 tdsodbc:i386 opus-tools opus-tools:i386 pulseaudio pulseaudio:i386 \
 librsvg2-bin:i386 hplip:i386 libsasl2-modules-gssapi-mit:i386 | libsasl2-modules-gssapi-heimdal:i386 libsasl2-modules-ldap:i386 libsasl2-modules-otp:i386 libsasl2-modules-sql:i386 lm-sensors:i386 \
 speex speex:i386 opencl-icd opencl-icd:i386 p7zip-rar zip libvdpau-va-gl1 libvdpau-va-gl1:i386 tor \
 unrar-free | unrar sane-airscan:i386 alsa-topology-conf alsa-ucm-conf \
 cabextract fuseiso gstreamer1.0-plugins-base gstreamer1.0-plugins-base:i386 i965-va-driver \
 i965-va-driver:i386 intel-media-va-driver intel-media-va-driver:i386 libaom3:i386 libapparmor1:i386 \
 libasound2 libasound2:i386 libasound2-data libasound2-plugins libasound2-plugins:i386 libasyncns0 libasyncns0:i386 libatomic1:i386 libavahi-client3:i386 libavahi-common-data:i386 \
 libavahi-common3:i386 libavcodec59 libavcodec59:i386 libavutil57 libavutil57:i386 libbrotli1:i386 libbsd0:i386 libcairo-gobject2:i386 libcairo2:i386 libcapi20-3 libcapi20-3:i386 \
 libcdparanoia0 libcdparanoia0:i386 libcodec2-1.0 libcodec2-1.0:i386 libcups2:i386 libcurl3-gnutls:i386 libcurl4:i386 libdatrie1:i386 \
 libdav1d6:i386 libdbus-1-3:i386 libdecor-0-0 libdecor-0-0:i386 \
 libdecor-0-plugin-1-cairo libdecor-0-plugin-1-cairo:i386 libdeflate0:i386 libdrm-amdgpu1:i386 libdrm-intel1:i386 libdrm-nouveau2:i386 libdrm-radeon1:i386 libdrm2:i386 libdw1:i386 libedit2:i386 \
 libelf1:i386 libexif12:i386 libexpat1:i386 libffi8:i386 libflac8 libflac8:i386 \
 libfontconfig1:i386 libfreetype6:i386 libfribidi0:i386 libfuse2 libgbm1 libgbm1:i386 libgd3:i386 libgdbm-compat4:i386 libgdbm6:i386 libgdk-pixbuf-2.0-0:i386 libglapi-mesa:i386 \
 libglib2.0-0:i386 libglu1-mesa libglu1-mesa:i386 libglvnd0:i386 libgnutls30:i386 libgomp1:i386 libgphoto2-6:i386 libgphoto2-port12:i386 \
 libgraphite2-3:i386 libgsm1 libgsm1:i386 libgstreamer-plugins-base1.0-0 \
 libgstreamer-plugins-base1.0-0:i386 libgstreamer1.0-0:i386 libharfbuzz0b:i386 libhogweed6:i386 libicu71:i386 libieee1284-3:i386 libigdgmm12 libigdgmm12:i386 \
 libjack-jackd2-0 libjack-jackd2-0:i386 \
 libjbig0:i386 libjpeg-turbo8:i386 libjpeg8:i386 liblcms2-2:i386 libldap-2.5-0:i386 libllvm15:i386 libltdl7:i386 libmd0:i386 libmfx1 \
 libmp3lame0 libmp3lame0:i386 libnettle8:i386 libnghttp2-14:i386 libnspr4:i386 libnss3:i386 libnuma1:i386 libodbc1 libodbc1:i386 libodbc2 \
 libodbc2:i386 libodbccr2 libodbccr2:i386 libogg0 libogg0:i386 libopengl0 libopengl0:i386 libopenjp2-7:i386 libopus0 libopus0:i386 liborc-0.4-0 \
 liborc-0.4-0:i386 libosmesa6 libosmesa6:i386 libp11-kit0:i386 libpango-1.0-0:i386 libpangocairo-1.0-0:i386 libpangoft2-1.0-0:i386 \
 libpcap0.8:i386 libpci3:i386 libpciaccess0:i386 libperl5.34:i386 libpixman-1-0:i386 libpng16-16:i386 libpoppler-glib8:i386 libpoppler123:i386 libpsl5:i386 libpulse0 \
 libpulse0:i386 librsvg2-2:i386 librsvg2-common:i386 librtmp1:i386 libsamplerate0 libsamplerate0:i386 libsane1:i386 libsasl2-2:i386 \
 libsasl2-modules:i386 libsasl2-modules-db:i386 libsdl2-2.0-0 libsdl2-2.0-0:i386 libsensors5:i386 libshine3 libshine3:i386 libsnappy1v5 \
 libsnappy1v5:i386 libsndfile1 libsndfile1:i386 libsnmp40:i386 libsoxr0 libsoxr0:i386 libspeex1 libspeex1:i386 libspeexdsp1 libspeexdsp1:i386 libsqlite3-0:i386 \
 libssh-4:i386 libstdc++6:i386 \
 libsvtav1enc1 libsvtav1enc1:i386 libswresample4 libswresample4:i386 libtasn1-6:i386 \
 libthai0:i386 libtheora0 libtheora0:i386 libtiff5:i386 libtwolame0 libtwolame0:i386 libunwind8:i386 libusb-1.0-0:i386 \
 libv4l-0 libv4l-0:i386 libv4lconvert0 libv4lconvert0:i386 libva-drm2 libva-drm2:i386 libva-x11-2 \
 libva-x11-2:i386 libva2 libva2:i386 libvdpau1 libvdpau1:i386 libvisual-0.4-0 libvisual-0.4-0:i386 libvorbis0a libvorbis0a:i386 libvorbisenc2 \
 libvorbisenc2:i386 libvpx7 libvpx7:i386 libwayland-client0:i386 libwayland-cursor0:i386 \
 libwayland-egl1:i386 libwayland-server0 libwayland-server0:i386 libwebp7:i386 libwebpmux3:i386 \
 libwrap0:i386 libx11-6:i386 libx11-xcb1:i386 libx264-164 libx264-164:i386 libx265-199:i386 libxau6:i386 libxcb-dri2-0:i386 libxcb-dri3-0:i386 libxcb-present0:i386 \
 libxcb-render0:i386 libxcb-shm0:i386 libxcb-sync1:i386 libxcb-xfixes0:i386 libxcb1:i386 libxcomposite1:i386 libxcursor1:i386 \
 libxdmcp6:i386 libxext6:i386 libxfixes3:i386 libxi6:i386 libxinerama1:i386 libxkbcommon0:i386 libxml2:i386 \
 libxpm4:i386 libxrandr2:i386 libxrender1:i386 libxshmfence1:i386 libxslt1.1:i386 libxss1 libxss1:i386 \
 libxvidcore4 libxvidcore4:i386 libxxf86vm1:i386 libzvbi-common libzvbi0 libzvbi0:i386 mesa-va-drivers mesa-va-drivers:i386 mesa-vdpau-drivers \
 mesa-vdpau-drivers:i386 ocl-icd-libopencl1 ocl-icd-libopencl1:i386 p7zip p7zip-full unzip va-driver-all va-driver-all:i386 vdpau-driver-all \
 vdpau-driver-all:i386 wine-stable wine-stable-amd64 wine-stable-i386:i386 winehq-stable winetricks

sudo apt upgrade winehq-stable winetricks

} &> /dev/null
kill -9 $SPIN_PID
echo "Done."