::https://jqlang.org/
::https://github.com/itchyny/gojq
@cls
jq --help
curl --silent -X GET "https://httpbin.org/get" | jq ".headers.\"User-Agent\"" --compact-output --raw-output
@pause