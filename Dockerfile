FROM postgres:10.7

#更新apt国内阿里云的源
#COPY sources.list /etc/apt/sources.list

ENV postgis_version postgis-2.5.3
COPY postgis_test.sh /

#编译安装
RUN apt-get update && apt-get install -y curl gcc make postgresql-server-dev-10 libxml2-dev libgeos-dev libproj-dev libgdal-dev libjson-c3 libgdal20 \
	&& curl -SLO https://download.osgeo.org/postgis/source/$postgis_version.tar.gz \
	&& tar -xf $postgis_version.tar.gz -C /usr/local/src/ \
	&& rm -rf $postgis_version.tar.gz \
	&& cd /usr/local/src/$postgis_version \
	&& ./configure  \
	&& make \
	&& make install \
	&& apt-get remove -y --purge  gcc make \
	&& apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && cd / \
    && rm -rf /usr/local/src/$postgis_version


