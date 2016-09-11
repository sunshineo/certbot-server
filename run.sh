#!/bin/bash
URL=$(echo $CODE | awk -F"." '{print $1}')
echo $CODE > .well-known/acme-challenge/$URL
python -c "import BaseHTTPServer, SimpleHTTPServer; s=BaseHTTPServer.HTTPServer(('', 80), SimpleHTTPServer.SimpleHTTPRequestHandler); s.serve_forever()"