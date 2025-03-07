@echo off

For /F "tokens=1* delims==" %%A IN (.env) DO (
    IF "%%A"=="GIT_ACCESS_TOKEN" set GIT_ACCESS_TOKEN=%%B
)

:: https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues
:: https://medium.com/swlh/introduction-to-graphql-with-github-api-64ee8bb11630
:: https://jscomplete.com/learn/complete-intro-graphql/1g-examples-github


set graphql=
for /f "delims=" %%a in (codeOfConduct.graphql) do (
    set graphql=%graphql%%%a
)
echo %graphql%


setlocal enabledelayedexpansion
set filePath=codeOfConduct.json
set fileContent=
:: Read the file and process each line
for /f "delims=" %%a in (%filePath%) do (
    set line=%%a
    :: Replace " with \"
    set line=!line:"=\\\"!
    set fileContent=!fileContent!!line!
)
echo %fileContent% > codeOfConduct.json.tmp
endlocal

set pars=
for /f "delims=" %%a in (codeOfConduct.json.tmp) do (
    set pars=%pars%%%a
)
echo %pars%


::curl -X POST ^
:: https://api.github.com/graphql ^
:: -H "accept: application/vnd.github+json" ^
:: -H "authorization: Bearer %GIT_ACCESS_TOKEN%" ^
:: -H "content-type: application/json" ^
:: -H "x-github-api-version: 2022-11-28" ^
:: -d "{\"query\":\"query codeOfConduct($key: String!) { codeOfConduct(key: $key) { body id key name resourcePath url } } \",\"variables\":\"{ \\\"key\\\": \\\"contributor_covenant\\\" }\"}"


curl -X POST ^
 https://api.github.com/graphql ^
 -H "accept: application/vnd.github+json" ^
 -H "authorization: Bearer %GIT_ACCESS_TOKEN%" ^
 -H "content-type: application/json" ^
 -H "x-github-api-version: 2022-11-28" ^
 -d "{\"query\":\"%graphql%\",\"variables\":\"%pars%\"}"
