::https://httpie.io/docs/cli
@cls
http -v GET "https://httpbin.org/get?isGood=true&isBad=false"
http -v DELETE "https://httpbin.org/delete"
http -v POST "https://httpbin.org/post" name="john deer" permissions:=[2000,3000,4000]
http -v PUT "https://httpbin.org/put" --form "name=john%20deer&permissions=2000&permissions=3000&permissions=4000"
http -v GET "https://httpbin.org/hidden-basic-auth/u/p" "Authorization: Basic dTpw"
http -v GET "https://httpbin.org/image/svg" "accept: image/svg+xml"
@pause
