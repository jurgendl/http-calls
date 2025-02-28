::https://rs.github.io/curlie/
@cls
curlie -v GET "https://httpbin.org/get?isGood=true&isBad=false"
curlie -v DELETE "https://httpbin.org/delete"
curlie -v POST "https://httpbin.org/post" --json "{ \"name\": \"john deer\", \"permissions\": [2000,3000,4000] }"
curlie -v PUT "https://httpbin.org/put" --data "name=john%20deer&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
curlie -v GET "https://httpbin.org/hidden-basic-auth/u/p" -H "Authorization: Basic dTpw"
curlie -v GET "https://httpbin.org/image/svg" -H "accept: image/svg+xml"
curlie -v GET "https://httpbin.org/drip?duration=2&numbytes=10&code=200&delay=2" -H "accept: application/octet-stream"
@pause