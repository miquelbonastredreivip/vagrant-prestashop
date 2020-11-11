#!/usr/bin/env python3
#
# Automate initial Prestashop configuration and installation.

import sys
import json
import requests

# ToDo: Control·lar paràmetres
#if len(sys.argv) < 2 :
#  print("ERROR: falta URL a cridar")
#  exit(1)

install_url="http://127.0.0.1:8080/install/index.php"

gStep1=f"{install_url}?step=welcome"

pStep2=install_url
rData2 = {
	"language": "en",
	"submitNext": "Next"
}

pStep3=install_url
rData3={
	"licence_agrement": "1",
	"submitNext": "Next"
}

pStep4=install_url
rData4={
	"shop_name": "NOM_DE_LA_BOTIGA",
	"shop_activity": "0",
	"db_mode": "full",
	"shop_country": "es",
	"shop_timezone": "Europe/Madrid",
	"admin_firstname": "NOM",
	"admin_lastname": "COGNOMS",
	"admin_email": "usuari@dreivip.com",
	"admin_password": "CONTRASENYA",
	"admin_password_confirm": "CONTRASENYA",
	"submitNext": "Next"
}

gStep5pre=f"{install_url}?checkDb=true&dbServer=127.0.0.1&dbName=prestashop&dbLogin=prestashop&dbPassword=&db_prefix=ps_"

pStep5=install_url
rData5={
	"dbServer": "127.0.0.1",
	"dbName": "prestashop",
	"dbLogin": "prestashop",
	"dbPassword": "",
	"db_prefix": "ps_",
	"rewrite_engine": "0",
	"submitNext": "Next"
}

install0=f"{install_url}?generateSettingsFile=true"
install1=f"{install_url}?installDatabase=true"
install2=f"{install_url}?installDefaultData=true"
install3=f"{install_url}?populateDatabase=true"
install4=f"{install_url}?configureShop=true"
install5=f"{install_url}?installModules=true"
install6=f"{install_url}?installModulesAddons=true"
install7=f"{install_url}?installTheme=true"
install8=f"{install_url}?installFixtures=true"

s = requests.Session()
lang="en"
headers = { "Accept-Language" : "{lang}" }
s.headers = headers

url=gStep1
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=pStep2
requestData=rData2
print(f"URL: {url}")
result = s.post(url, requestData)
print(requestData)
print(result.status_code)
print(result.headers)
print(result.text)

url=pStep3
requestData=rData3
print(f"URL: {url}")
result = s.post(url, requestData)
print(requestData)
print(result.status_code)
print(result.headers)
print(result.text)

url=pStep4
requestData=rData4
print(f"URL: {url}")
result = s.post(url, requestData)
print(requestData)
print(result.status_code)
print(result.headers)
print(result.text)

url=gStep5pre
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)


url=pStep5
requestData=rData5
print(f"URL: {url}")
result = s.post(url, requestData)
print(requestData)
print(result.status_code)
print(result.headers)
print(result.text)

url=install0
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=install1
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=install2
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=install3
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=install4
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=install5
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=install6
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=install7
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

url=install8
print(f"URL: {url}")
result = s.get(url)
print(result.status_code)
print(result.headers)
print(result.text)

