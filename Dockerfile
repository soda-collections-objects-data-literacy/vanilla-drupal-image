FROM drupal:11.0.1-php8.3-apache-bookworm

LABEL org.opencontainers.image.source=https://github.com/soda-collections-objects-data-literacy/vanilla-drupal-image.git
LABEL org.opencontainers.image.description="Plain vanilla Drupal with preinstalled Site based one the given env variables."

# Install apts

RUN apt-get update; \
    apt-get install -y --no-install-recommends \
    default-mysql-client \
    git \
    unzip \
    vim \
    wget

# Install drush
RUN composer require drush/drush

# add composer bin to PATH
RUN ln -s /opt/drupal/vendor/bin/drush /usr/local/bin/drush

RUN chown -R www-data:www-data /var/www/html

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
