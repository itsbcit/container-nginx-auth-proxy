[ -z "$AUTH_TOKEN" ] && echo "AUTH_TOKEN env var not defined" && exit 1
[ -z "$PROXY_ADDR" ] && echo "PROXY_ADDR env var not defined" && exit 1
[ -z "$PROXY_PORT" ] && echo "PROXY_PORT env var not defined" && exit 1

for tmpl_file in $( find /etc/nginx/conf.d/ -type f -name '*.tmpl' -not -path '*/\.git/*' 2>/dev/null ); do
    config_file="$( dirname -- "$tmpl_file" )/$( basename -- "$tmpl_file" .tmpl )"
    echo "dockerizing: ${tmpl_file}"
    echo "         =>  ${config_file}"
    dockerize -template "$tmpl_file":"$config_file" \
    && rm -f "$tmpl_file"
done

for tmpl_file in $( find /etc/nginx/http.d/ -type f -name '*.tmpl' -not -path '*/\.git/*' 2>/dev/null ); do
    config_file="$( dirname -- "$tmpl_file" )/$( basename -- "$tmpl_file" .tmpl )"
    echo "dockerizing: ${tmpl_file}"
    echo "         =>  ${config_file}"
    dockerize -template "$tmpl_file":"$config_file" \
    && rm -f "$tmpl_file"
done