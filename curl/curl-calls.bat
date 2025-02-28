::https://curl.se/docs/
@cls
curl -v -X GET "https://httpbin.org/get?isGood=true&isBad=false"
curl -v -X DELETE "https://httpbin.org/delete"
curl -v -X POST "https://httpbin.org/post" --json "{""name"": ""john deer"", ""permissions"": [2000,3000,4000]}"
curl -v -X PUT "https://httpbin.org/put" --data "name=john+deer&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
curl -v -X GET "https://httpbin.org/hidden-basic-auth/u/p" -H "Authorization: Basic dTpw"
@pause