FROM php:7.3-fpm

# Debian update and install dependencies
RUN apt-get update && apt-get install -y \
    bash sudo curl libzip-dev zip unzip

# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - \
  && sudo apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
  && sudo apt update && sudo apt install --no-install-recommends yarn

# Docker php configure and install extensions
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install bcmath pdo_mysql exif zip

# Workdir container
WORKDIR /var/www

# Remove folder html
RUN rm -rf /var/www/html

# Symbolic link
RUN ln -s public html

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add user for laravel application
RUN groupadd -g 1000 www
RUN useradd -u 1000 -ms /bin/bash -g www www

# Copy existing application directory contents
COPY . /var/www

# Copy existing application directory permissions
COPY --chown=www:www . /var/www

# Change current user to www
USER www

# Port
EXPOSE 9000