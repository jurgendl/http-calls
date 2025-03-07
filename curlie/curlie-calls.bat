::https://rs.github.io/curlie/
@cls
curlie --help
curlie -v -X GET "https://httpbin.org/get?isGood=true&isBad=false"
curlie -v -X DELETE "https://httpbin.org/delete"
curlie -v -X POST "https://httpbin.org/post" --json "{\"name\":\"john deer\",\"permissions\":[2000,3000,4000]}"
curlie -v -X PUT "https://httpbin.org/put" --data "name=john+deer&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
curlie -v -X GET "https://httpbin.org/hidden-basic-auth/u/p" -H "Authorization: Basic dTpw"
curlie -v -X GET "https://httpbin.org/image/svg" -H "accept: image/svg+xml"
curlie -v -X GET "https://httpbin.org/drip?duration=2&numbytes=10&code=200&delay=2" -H "accept: application/octet-stream"
curlie -v -X GET "https://httpbin.org/bearer" -H "accept: application/json" -H "Authorization: Bearer bearer"
curlie -v -X GET "https://httpbin.org/gzip" --output "gzip.gz"
curlie -v -X GET "https://github.com/httpie/cli/archive/master.tar.gz" --location --output "master.tar.gz"
curlie -v -X GET "https://httpbin.org/stream-bytes/1048576" --location --output "1048576.bin"
@pause