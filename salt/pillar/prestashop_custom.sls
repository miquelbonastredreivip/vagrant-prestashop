prestashop:
  lookup:
    ps_dir: /var/www/prestashop
    ps_index: /var/www/prestashop/index.php
    ps_zip: /var/www/prestashop/prestashop.zip
    ps_zip_hash: ef2e9faf94f666f0594906b7c6f38656691f1220
    ps_zip_content: /var/www/prestashop/src
    ps_install: /var/www/prestashop/install
    ps_extract_creates: /var/www/prestashop/src
    ps_user: www-data
    download_url: https://download.prestashop.com/download/releases/prestashop_1.7.6.1.zip
    download_hash: 8ecd63f7c8c374938175aa653f5ed426
    apache_url: http://127.0.0.1:8080
    extract_url: http://127.0.0.1:8080/index.php
    version_url: http://127.0.0.1:8080/index.php?run=check-version
    install_url: http://127.0.0.1:8080/install/index.php

#
# Pillar data: parameters for Prestashop installation utility: index_cli.php
#
ps_index_cli:
  params:
    step: all
    # System parameters
    language: es
    timezone: Europe/Barcelona
    domain: localhost:8080
    # DB parameters
    db_server: localhost
    db_user: prestashop
    db_password: ''
    db_name: prestashop
    db_clear: 1
    db_create: 0
    prefix: ps_
    engine: InnoDB
    # Shop parameters
    name: Shop Name
    activity: 0
    country: es
    firstname: John
    lastname: Smith
    password: Password
    email: admin@null.com
    ssl: 0
    theme: ''
    newsletter: 0
    license: 0
  other:
    install_dir: /var/www/prestashop/install
    index_cli: /var/www/prestashop/install/index_cli.php

# Arguments available:
# --step	all / database,fixtures,theme,modules,addons_modules	(Default: all)
# --language	language iso code	(Default: en)
# --all_languages	install all available languages	(Default: 0)
# --timezone		(Default: Europe/Paris)
# --base_uri		(Default: /)
# --domain		(Default: localhost)
# --db_server		(Default: localhost)
# --db_user		(Default: root)
# --db_password		(Default: )
# --db_name		(Default: prestashop)
# --db_clear	Drop existing tables	(Default: 1)
# --db_create	Create the database if not exist	(Default: 0)
# --prefix		(Default: ps_)
# --engine	InnoDB/MyISAM	(Default: InnoDB)
# --name		(Default: PrestaShop)
# --activity		(Default: 0)
# --country		(Default: fr)
# --firstname		(Default: John)
# --lastname		(Default: Doe)
# --password		(Default: 0123456789)
# --email		(Default: pub@prestashop.com)
# --license	show PrestaShop license	(Default: 0)
# --newsletter	get news from PrestaShop	(Default: 1)
# --theme		(Default: )
# --ssl	enable SSL for PrestaShop	(Default: 0)

