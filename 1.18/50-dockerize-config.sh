for tmpl_file in $( find /etc/nginx/conf.d/ -type f -name '*.tmpl' -not -path '*/\.git/*' 2>/dev/null ); do
    config_file="$( dirname -- "$tmpl_file" )/$( basename -- "$tmpl_file" .tmpl )"
    echo "dockerizing: ${tmpl_file}"
    echo "         =>  ${config_file}"
    dockerize -template "$tmpl_file":"$config_file" \
    && rm -f "$tmpl_file"
done
