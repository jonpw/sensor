FROM debian
RUN apt update && \
    apt-get install build-essential && \
    apt-get install git
RUN adduser jenkins
USER jenkins
ADD /files /opt
RUN cd /opt && tar xvif gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 && rm gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2
RUN cd /opt && unzip nRF5_SDK_14.2.0_17b948a.zip nrf5sdk && rm nRF5_SDK_14.2.0_17b948a.zip

