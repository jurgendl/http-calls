cls
curlie -X GET "https://httpbin.org/get?isGood=true&isBad=false"
curlie -X DELETE "https://httpbin.org/delete"
curlie -X POST "https://httpbin.org/post" --data "{""name"": ""john"", ""permissions"": [2000,3000,4000]}"
curlie -X PUT "https://httpbin.org/put" --data "name=john&permissions=2000&permissions=3000&permissions=4000" -H "Content-Type: application/x-www-form-urlencoded"
pause