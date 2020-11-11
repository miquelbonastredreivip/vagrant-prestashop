include:
  - packages
  - mysql
  - mysql.remove_test_database
  - php
  - php.cli
  - php.zip
  - php.xml
  - php.curl
  - php.gd
  - php.mysql
  - php.intl
  - apache
  - apache.config.modules.mod_rewrite

wait_for_apache:
  http.wait_for_successful_query:
    - name: {{ salt['pillar.get']('prestashop:lookup:apache_url') }}
    - wait_for: 300
    - request_interval: 1
    - status: 200

extract_prestashop_package:
  archive.extracted:
    - name: {{ salt['pillar.get']('prestashop:lookup:ps_dir') }}
    - source: {{ salt['pillar.get']('prestashop:lookup:download_url') }}
    - source_hash: {{ salt['pillar.get']('prestashop:lookup:download_hash') }}
    - user: {{ salt['pillar.get']('prestashop:lookup:ps_user') }}
    - keep_source: false
    - enforce_toplevel: false
    - enforce_ownership_on: {{ salt['pillar.get']('prestashop:lookup:ps_dir') }}
    - unless:
      - ls {{ salt['pillar.get']('prestashop:lookup:ps_dir') }}/* > /dev/null 2>&1

extract_prestashop_zip:
  archive.extracted:
    - name: {{ salt['pillar.get']('prestashop:lookup:ps_dir') }}
    - source: {{ salt['pillar.get']('prestashop:lookup:ps_zip') }}
    - source_hash: {{ salt['pillar.get']('prestashop:lookup:ps_zip_hash') }}
    - user: {{ salt['pillar.get']('prestashop:lookup:ps_user') }}
    - keep_source: false
    - enforce_toplevel: false
    - enforce_ownership_on: {{ salt['pillar.get']('prestashop:lookup:ps_dir') }}


# ToDo:
#  - Local repo to cache Prestashop
#  - Create flags to not repeat steps
#  - Only unzip required files
#  - Check mysql install before installation
#  - Delete install dir after installation

{% set step        =  salt['pillar.get']('ps_index_cli:params:step')        %}
{% set language    =  salt['pillar.get']('ps_index_cli:params:language')    %}
{% set timezone    =  salt['pillar.get']('ps_index_cli:params:timezone')    %}
{% set domain      =  salt['pillar.get']('ps_index_cli:params:domain')      %}
{% set db_server   =  salt['pillar.get']('ps_index_cli:params:db_server')   %}
{% set db_user     =  salt['pillar.get']('ps_index_cli:params:db_user')     %}
{% set db_password =  salt['pillar.get']('ps_index_cli:params:db_password') %}
{% set db_name     =  salt['pillar.get']('ps_index_cli:params:db_name')     %}
{% set db_clear    =  salt['pillar.get']('ps_index_cli:params:db_clear')    %}
{% set db_create   =  salt['pillar.get']('ps_index_cli:params:db_create')   %}
{% set prefix      =  salt['pillar.get']('ps_index_cli:params:prefix')      %}
{% set engine      =  salt['pillar.get']('ps_index_cli:params:engine')      %}
{% set name        =  salt['pillar.get']('ps_index_cli:params:name')        %}
{% set activity    =  salt['pillar.get']('ps_index_cli:params:activity')    %}
{% set country     =  salt['pillar.get']('ps_index_cli:params:country')     %}
{% set firstname   =  salt['pillar.get']('ps_index_cli:params:firstname')   %}
{% set lastname    =  salt['pillar.get']('ps_index_cli:params:lastname')    %}
{% set password    =  salt['pillar.get']('ps_index_cli:params:password')    %}
{% set email       =  salt['pillar.get']('ps_index_cli:params:email')       %}
{% set ssl         =  salt['pillar.get']('ps_index_cli:params:ssl')         %}
{% set theme       =  salt['pillar.get']('ps_index_cli:params:them')        %}
{% set newsletter  =  salt['pillar.get']('ps_index_cli:params:newsletter')  %}
{% set license     =  salt['pillar.get']('ps_index_cli:params:license')     %}

{% set install_dir = salt['pillar.get']('ps_index_cli:other:install_dir')   %}
{% set index_cli   = salt['pillar.get']('ps_index_cli:other:index_cli')     %}

install_prestashop:
  cmd.run:
    - name:
        php {{ index_cli }}
        --step={{step}}
        --language={{language}}       
        --timezone={{timezone}}       
        --domain={{domain}}           
        --db_server={{db_server}}     
        --db_user={{db_user}}         
        --db_password={{db_password}} 
        --db_name={{db_name}}         
        --db_clear={{db_clear}}       
        --db_create={{db_create}}     
        --prefix={{prefix}}           
        --engine={{engine}}           
        --name={{name}}               
        --activity={{activity}}       
        --country={{country}}         
        --firstname={{firstname}}     
        --lastname={{lastname}}       
        --password={{password}}       
        --email={{email}}             
        --license={{license}}         
        --newsletter={{newsletter}}   
        --theme={{theme}}             
        --ssl={{ssl}}
    - onlyif: test -d {{install_dir}}
    - cwd: {{install_dir}}
    - require:
      - extract_prestashop_zip
  file.directory:
    - name: {{ salt['pillar.get']('prestashop:lookup:ps_dir') }}
    - user: {{ salt['pillar.get']('prestashop:lookup:ps_user') }}
    - recurse:
      - user

post-install-prestashop:
  file.absent:
    - name: {{install_dir}}
    - require:
      - install_prestashop
