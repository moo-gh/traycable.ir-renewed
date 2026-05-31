FROM wordpress:php7.4-apache

RUN apt-get update \
    && apt-get install -y --no-install-recommends curl ca-certificates \
    && cd /tmp \
    && curl -fsSL -o ioncube.tar.gz https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
    && tar xzf ioncube.tar.gz \
    && EXT_DIR="$(php -r 'echo ini_get("extension_dir");')" \
    && cp ioncube/ioncube_loader_lin_7.4.so "${EXT_DIR}/" \
    && echo "zend_extension=${EXT_DIR}/ioncube_loader_lin_7.4.so" > /usr/local/etc/php/conf.d/00-ioncube.ini \
    && rm -rf /tmp/ioncube* \
    && apt-get purge -y curl \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
