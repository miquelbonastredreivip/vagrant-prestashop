apache:
  sites:
    prestashop:
      port: 8080
      enabled: true
      template_file: salt://apache/config/vhosts/standard.tmpl
      # No hauria de ser necessari indicar el DocumentRoot ...
      DocumentRoot: /var/www/prestashop

