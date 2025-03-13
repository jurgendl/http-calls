::https://github.com/ducaale/xh
@cls
xh --help
xh   --verbose GET "https://httpbingo.org/get?isGood=true&isBad=false"
xh   --verbose DELETE "https://httpbingo.org/delete"
xh   --verbose POST "https://httpbingo.org/post" name="john deer" permissions:=[2000,3000,4000]
xh   --verbose PUT "https://httpbingo.org/put" --form name="john deer" permissions=2000 permissions=3000 permissions=4000
xh   --verbose GET "https://httpbingo.org/hidden-basic-auth/u/p" "Authorization: Basic dTpw"
xh   --verbose GET "https://httpbingo.org/image/svg" "accept: image/svg+xml"
xh   --verbose GET "https://httpbingo.org/drip?duration=2&numbytes=10&code=200&delay=2" "accept: application/octet-stream" --stream 
xh   --verbose GET "https://httpbingo.org/bearer" "accept: application/json" "Authorization: Bearer bearer"
xh   --verbose --download GET "https://httpbingo.org/gzip" --output "gzip.json"
xh   --verbose --download GET "https://github.com/httpie/cli/archive/master.tar.gz" --output "master.tar.gz"
xh   --verbose --download GET "https://httpbingo.org/stream-bytes/1048576" --output "1048576.bin"
@pause