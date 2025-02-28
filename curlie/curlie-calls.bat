::https://rs.github.io/curlie/
@cls
curlie -v GET "https://httpbin.org/get?isGood=true&isBad=false"
curlie -v DELETE "https://httpbin.org/delete"
curlie -v POST "https://httpbin.org/post" --json "{ \"name\": \"john\", \"permissions\": [2000,3000,4000] }"
curlie -v PUT "https://httpbin.org/put" --data "name=john&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
@pause