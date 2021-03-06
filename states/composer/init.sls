composer-install:
    cmd.run:
        - name: curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
        - unless:
            - ls /usr/local/bin/composer

composer-selfupdate:
    cmd.run:
        - name: composer self-update
        - onfail:
            - cmd: composer-install

composer-install-phpcs:
    cmd.run:
        - name: composer global require "squizlabs/php_codesniffer=*"
        - user: {{ grains.user }}
        - require:
            - cmd: composer-install
            
