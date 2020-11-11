include:
  - packages

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

# extract_prestashop:
#   cmd.script:
#     - name: ps_extract.py {{ salt['pillar.get']('prestashop:lookup:extract_url') }}
#     - source: salt://scripts/ps_extract.py
#     #- creates: {{ salt['pillar.get']('prestashop:lookup:ps_zip_content') }}
#     - require:
#       - wait_for_apache
#     - require_in:
#       - http: install_assistant
#     - onlyif:
#       - test -f {{ salt['pillar.get']('prestashop:lookup:ps_zip') }}

# install_assistant:
#   http.query:
#     - name: {{ salt['pillar.get']('prestashop:lookup:install_url') }}
#     - status: 200
#     - require:
#       - http: wait_for_apache

# install_prestashop:
#   cmd.script:
#     - name: ps_install.py {{ salt['pillar.get']('prestashop:lookup:install_url') }}
#     - source: salt://scripts/ps_install.py
#     #- creates: {{ salt['pillar.get']('prestashop:lookup:ps_zip_content') }}
#     - require:
#       - wait_for_apache
#     - require_in:
#       - http: install_assistant
#     - onlyif:
#       - test -f {{ salt['pillar.get']('prestashop:lookup:ps_zip') }}

# ToDo:
#  - Local repo to cache Prestashop
#  - Create flags to not repeat steps
#  - Only unzip required files
#  - Check mysql install before installation
#  - Delete install dir after installation

