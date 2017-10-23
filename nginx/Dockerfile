FROM mishamx/nginx:envplate

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
						apache2-utils \
	&& rm -rf /var/lib/apt/lists/*

ENV AUTH_USER nginx
ENV AUTH_PASS nginx

CMD ["/etc/nginx-source/init.sh"]
