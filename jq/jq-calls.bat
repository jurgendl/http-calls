::https://jqlang.org/
@cls
jq --help
curl --silent -X GET "https://httpbin.org/get" | jq ".headers.\"User-Agent\"" --compact-output --raw-output
@pause