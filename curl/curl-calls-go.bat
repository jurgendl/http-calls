::https://curl.se/docs/
@cls
curl --help
curl   --verbose -X GET "https://httpbingo.org/get?isGood=true&isBad=false"
curl   --verbose -X DELETE "https://httpbingo.org/delete"
curl   --verbose -X POST "https://httpbingo.org/post" --json "{\"name\":\"john deer\",\"permissions\":[2000,3000,4000]}"
curl   --verbose -X PUT "https://httpbingo.org/put" --data "name=john+deer&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
curl   --verbose -X GET "https://httpbingo.org/hidden-basic-auth/u/p" -H "Authorization: Basic dTpw"
curl   --verbose -X GET "https://httpbingo.org/image/svg" -H "accept: image/svg+xml"
curl   --verbose -X GET "https://httpbingo.org/drip?duration=2&numbytes=10&code=200&delay=2" -H "accept: application/octet-stream"
curl   --verbose -X GET "https://httpbingo.org/bearer" -H "accept: application/json" -H "Authorization: Bearer bearer"
curl   --verbose -X GET "https://httpbingo.org/gzip" --output "gzip.gz"
curl   --verbose -X GET "https://github.com/httpie/cli/archive/master.tar.gz" --location --output "master.tar.gz"
curl   --verbose -X GET "https://httpbingo.org/stream-bytes/1048576" --location --output "1048576.bin"
@pause