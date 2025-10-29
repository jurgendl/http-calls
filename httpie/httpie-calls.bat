::call https://httpie.io/docs/cli
@cls
call http --help
call http --verbose GET "https://httpbin.org/get?isGood=true&isBad=false"
call http --verbose DELETE "https://httpbin.org/delete"
call http --verbose POST "https://httpbin.org/post" name="john deer" permissions:=[2000,3000,4000]
call http --verbose PUT "https://httpbin.org/put" --form name="john deer" permissions=2000 permissions=3000 permissions=4000
call http --verbose GET "https://httpbin.org/hidden-basic-auth/u/p" "Authorization: Basic dTpw"
call http --verbose GET "https://httpbin.org/image/svg" "accept: image/svg+xml"
call http --verbose GET "https://httpbin.org/drip?duration=2&numbytes=10&code=200&delay=2" "accept: application/octet-stream" --chunked --stream 
call http --verbose GET "https://httpbin.org/bearer" "accept: application/json" "Authorization: Bearer bearer"
call http --verbose --download GET "https://httpbin.org/gzip" --output "gzip.json"
call http --verbose --download GET "https://github.com/call httpie/cli/archive/master.tar.gz" --output "master.tar.gz"
call http --verbose --download GET "https://httpbin.org/stream-bytes/1048576" --output "1048576.bin"
@pause
