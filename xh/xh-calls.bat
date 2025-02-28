::https://github.com/ducaale/xh
@cls
xh -v GET "https://httpbin.org/get?isGood=true&isBad=false"
xh -v DELETE "https://httpbin.org/delete"
xh -v POST "https://httpbin.org/post" name="john deer" permissions:=[2000,3000,4000]
xh -v PUT "https://httpbin.org/put" --form "name=john+deer&permissions=2000&permissions=3000&permissions=4000"
xh -v GET "https://httpbin.org/hidden-basic-auth/u/p" "Authorization: Basic dTpw"
xh -v GET "https://httpbin.org/image/svg" "accept: image/svg+xml"
xh -v GET "https://httpbin.org/drip?duration=2&numbytes=10&code=200&delay=2" "accept: application/octet-stream"
@pause