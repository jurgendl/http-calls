::https://httpie.io/docs/cli
@cls
http --help
http -v GET "https://httpbin.org/get?isGood=true&isBad=false"
http -v DELETE "https://httpbin.org/delete"
http -v POST "https://httpbin.org/post" name="john deer" permissions:=[2000,3000,4000]
http -v PUT "https://httpbin.org/put" --form name="john deer" permissions=2000 permissions=3000 permissions=4000
http -v GET "https://httpbin.org/hidden-basic-auth/u/p" "Authorization: Basic dTpw"
http -v GET "https://httpbin.org/image/svg" "accept: image/svg+xml"
http -v GET "https://httpbin.org/drip?duration=2&numbytes=10&code=200&delay=2" "accept: application/octet-stream" --chunked --stream 
http -v GET "https://httpbin.org/bearer" "accept: application/json" "Authorization: Bearer bearer"
http -v --download GET "https://httpbin.org/gzip" --output "gzip.json"
http -v --download GET "https://github.com/httpie/cli/archive/master.tar.gz" --output "master.tar.gz"
http -v --download GET "https://httpbin.org/stream-bytes/1048576" --output "1048576.bin"
@pause
