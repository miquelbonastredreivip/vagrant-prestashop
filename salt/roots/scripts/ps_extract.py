#!/usr/bin/env python3
import sys
import json
import requests

if len(sys.argv) < 2 :
  print("ERROR: falta URL a cridar")
  exit(1)

#jsonData='{"error":false,"numFiles":24078,"lastId":500}'
#url="http://127.0.0.1:8080/index.php"
url=sys.argv[1]
maxIterations = 2000

arrayData = ''
error = False
lastId  = -1
startId = 0
numFiles = 0
iteration = 0

while not error and lastId < numFiles and iteration < maxIterations:
  try:
    requestData = { "extract" : "true" , "startId" : startId }
    result = requests.post(url, data = requestData)
    jsonData = result.text
  except:
    print("ERROR: Error desconegut requests")
    exit(3)

  try:
    arrayData = json.loads(jsonData)
  except json.decoder.JSONDecodeError:
    print("ERROR: URL no retorna JSON")
    exit(2)
  except:
    print("ERROR: Error desconegut json.loads")
    exit(3)

  error    = arrayData['error']
  numFiles = arrayData['numFiles']
  lastId   = arrayData['lastId']

  startId = lastId

print("error: {error}")
print("numFiles: {numFiles}")
print("lastId: {lastId}")
print("startId: {startId}")
print("iteration: {iteration}")

if error:
  print("ERROR: URL ha retornat error")
  exit(4)
else:
  exit(0)

