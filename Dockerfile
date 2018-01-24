FROM ubuntu

ENV UNITY_VERSION UnitySetup-2017.3.0p2
ENV UNITY_COMPONENTS Unity,Windows

RUN apt-get update && apt-get install -y \
		debconf \
		gconf-service \
		lib32gcc1 \
		lib32stdc++6 \
		libarchive13 \
		libasound2 \
		libc6 \
		libc6-i386 \
		libcairo2 \
		libcap2 \
		libcups2 \
		libdbus-1-3 \
		libexpat1 \
		libfontconfig1 \
		libfreetype6 \
		libgcc1 \
		libgconf-2-4 \
		libgdk-pixbuf2.0-0 \
		libgl1-mesa-glx \
		libglib2.0-0 \
		libglu1-mesa \
		libgtk2.0-0 \
		libnspr4 \
		libnss3 \
		libpango1.0-0 \
		libpq5 \
		libsoup2.4-1 \
		libstdc++6 \
		libx11-6 \
		libxcomposite1 \
		libxcursor1 \
		libxdamage1 \
		libxext6 \
		libxfixes3 \
		libxi6 \
		libxrandr2 \
		libxrender1 \
		libxtst6 \
		lsb-release \
		npm \
		wget \
		xdg-utils \
		xvfb \
		zlib1g

RUN wget http://beta.unity3d.com/download/7807bc63c3ab/$UNITY_VERSION && \
	chmod +x $UNITY_VERSION && \
	echo y | ./$UNITY_VERSION \
		--unattended \
		--components=${UNITY_COMPONENTS} \
		--install-location=/opt/Unity \
		--download-location=/tmp/unity \
		&& \
	rm $UNITY_VERSION && \
	rm -rf /tmp/unity

