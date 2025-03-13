::https://httpie.io/docs/cli
@cls
http --help
http --verbose GET "https://httpbingo.org/get?isGood=true&isBad=false"
http --verbose DELETE "https://httpbingo.org/delete"
http --verbose POST "https://httpbingo.org/post" name="john deer" permissions:=[2000,3000,4000]
http --verbose PUT "https://httpbingo.org/put" --form name="john deer" permissions=2000 permissions=3000 permissions=4000
http --verbose GET "https://httpbingo.org/hidden-basic-auth/u/p" "Authorization: Basic dTpw"
http --verbose GET "https://httpbingo.org/image/svg" "accept: image/svg+xml"
http --verbose GET "https://httpbingo.org/drip?duration=2&numbytes=10&code=200&delay=2" "accept: application/octet-stream" --chunked --stream 
http --verbose GET "https://httpbingo.org/bearer" "accept: application/json" "Authorization: Bearer bearer"
http --verbose --download GET "https://httpbingo.org/gzip" --output "gzip.json"
http --verbose --download GET "https://github.com/httpie/cli/archive/master.tar.gz" --output "master.tar.gz"
http --verbose --download GET "https://httpbingo.org/stream-bytes/1048576" --output "1048576.bin"
@pause
