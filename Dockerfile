FROM postgres:10.7

#更新apt国内阿里云的源
#COPY sources.list /etc/apt/sources.list

ENV postgis_version postgis-2.5.3

#编译安装
RUN apt-get update && apt-get install -y gcc make postgresql-server-dev-10 libxml2-dev libgeos-dev libproj-dev libgdal-dev \
	#下载postgis
	&& curl -SLO https://download.osgeo.org/postgis/source/$postgis_version.tar.gz \
	&& tar -xf $postgis_version.tar.gz -C /usr/local/src/ \
	&& cd /usr/local/src/$postgis_version \
	#编译安装
	&& ./configure  \
	&& make \
	&& make install \
	#清理不必要的依赖
	&& apt-get remove -y --purge  gcc make postgresql-server-dev-10 libxml2-dev libgeos-dev libproj-dev libgdal-dev \
	&& apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && cd / \
    && rm -rf /usr/local/src/$postgis_version


