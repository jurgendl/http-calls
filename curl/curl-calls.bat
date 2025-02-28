cls
curl -X GET "https://httpbin.org/get?isGood=true&isBad=false"
curl -X DELETE "https://httpbin.org/delete"
curl -X POST "https://httpbin.org/post" --data "{""name"": ""john"", ""permissions"": [2000,3000,4000]}"
curl -X PUT "https://httpbin.org/put" --data "name=john&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
pause