::https://rs.github.io/curlie/
@cls
curlie -v GET "https://httpbin.org/get?isGood=true&isBad=false"
curlie -v DELETE "https://httpbin.org/delete"
curlie -v POST "https://httpbin.org/post" --json "{ \"name\": \"john deer\", \"permissions\": [2000,3000,4000] }"
curlie -v PUT "https://httpbin.org/put" --data "name=john%20deer&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
curlie -v -X GET "https://httpbin.org/hidden-basic-auth/u/p" -H "Authorization: Basic dTpw"
@pause