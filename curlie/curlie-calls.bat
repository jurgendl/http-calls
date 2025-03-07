::https://rs.github.io/curlie/
@cls
curlie --help
curlie --verbose -X GET "https://httpbin.org/get?isGood=true&isBad=false"
curlie --verbose -X DELETE "https://httpbin.org/delete"
curlie --verbose -X POST "https://httpbin.org/post" --json "{\"name\":\"john deer\",\"permissions\":[2000,3000,4000]}"
curlie --verbose -X PUT "https://httpbin.org/put" --data "name=john+deer&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
curlie --verbose -X GET "https://httpbin.org/hidden-basic-auth/u/p" -H "Authorization: Basic dTpw"
curlie --verbose -X GET "https://httpbin.org/image/svg" -H "accept: image/svg+xml"
curlie --verbose -X GET "https://httpbin.org/drip?duration=2&numbytes=10&code=200&delay=2" -H "accept: application/octet-stream"
curlie --verbose -X GET "https://httpbin.org/bearer" -H "accept: application/json" -H "Authorization: Bearer bearer"
curlie --verbose -X GET "https://httpbin.org/gzip" --output "gzip.gz"
curlie --verbose -X GET "https://github.com/httpie/cli/archive/master.tar.gz" --location --output "master.tar.gz"
curlie --verbose -X GET "https://httpbin.org/stream-bytes/1048576" --location --output "1048576.bin"
@pause