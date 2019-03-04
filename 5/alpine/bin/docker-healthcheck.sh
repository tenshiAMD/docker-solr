#!/bin/bash

set -eo pipefail

host="$(hostname -i || echo '127.0.0.1')"
user="${SOLR_USER:-root}"
port="${SOLR_PORT:-8983}"
timestamp=`date +"%s"`
url="http://${host}:${port}/solr/default/admin/ping?wt=json&ts=${timestamp}_=${timestamp}"

statusCode=`curl -I $url 2>/dev/null | head -n 1 | cut -d$' ' -f2`
successCode=200

if [ "$statusCode" = "$successCode" ]; then
	exit 0
fi

exit 1
