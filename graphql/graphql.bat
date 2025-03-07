@echo off

:: https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues
:: https://medium.com/swlh/introduction-to-graphql-with-github-api-64ee8bb11630
:: https://jscomplete.com/learn/complete-intro-graphql/1g-examples-github


::curl -X POST ^
:: https://api.github.com/graphql ^
:: -H "accept: application/vnd.github+json" ^
:: -H "authorization: Bearer %GIT_ACCESS_TOKEN%" ^
:: -H "content-type: application/json" ^
:: -H "x-github-api-version: 2022-11-28" ^
:: -d "{\"query\":\"query codeOfConduct($key: String!) { codeOfConduct(key: $key) { body id key name resourcePath url } } \",\"variables\":\"{ \\\"key\\\": \\\"contributor_covenant\\\" }\"}"

:: "{\"query\":\"{ viewer { repositories(last: 10) { nodes { name description } } } }\"}"
:: echo curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer %GIT_ACCESS_TOKEN%" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/graphql --data "{\"query\":\" {viewer{repositories(last:10){nodes{name description}}}} \"}"
:: echo curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer %GIT_ACCESS_TOKEN%" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/graphql --data "{\"query\":\" %graphql% \"}"


::echo %~1
::echo %~2
set graphql_file=%~1
::echo %graphql_file%
if not "%~2"=="" (
    set graphql_parameters_file=%~2
	if not exist "%graphql_parameters_file%" (
		echo Error: GraphQL file "%graphql_parameters_file%" not found.
		exit /b 1
	)
) else (
	set graphql_parameters_file=tmp.tmp
)
::echo %graphql_parameters_file%

:: Check if the GraphQL file exists
if not exist "%graphql_file%" (
    echo Error: GraphQL file "%graphql_file%" not found.
    exit /b 1
)

For /F "tokens=1* delims==" %%A IN (.env) DO (
    IF "%%A"=="GIT_ACCESS_TOKEN" set GIT_ACCESS_TOKEN=%%B
)

set graphql=
for /f "delims=" %%a in (%graphql_file%) do (
    set graphql=%graphql%%%a
)
::echo %graphql%

if not exist %graphql_parameters_file% (
	goto no_graphql_parameters_file
) else (
	goto found_graphql_parameters_file
)



:no_graphql_parameters_file
curl -X POST ^
	https://api.github.com/graphql ^
	-H "accept: application/vnd.github+json" ^
	-H "authorization: Bearer %GIT_ACCESS_TOKEN%" ^
	-H "content-type: application/json" ^
	-H "x-github-api-version: 2022-11-28" ^
	-d "{\"query\":\"%graphql%\"}"
goto completed




:found_graphql_parameters_file
setlocal enabledelayedexpansion
set filePath=%graphql_parameters_file%
set fileContent=
:: Read the file and process each line
for /f "delims=" %%a in (%filePath%) do (
    set line=%%a
    :: Replace " with \"
    set line=!line:"=\\\"!
    set fileContent=!fileContent!!line!
)
echo %fileContent% > %graphql_parameters_file%.tmp
endlocal

set pars=
for /f "delims=" %%a in (%graphql_parameters_file%.tmp) do (
    set pars=%pars%%%a
)
::echo %pars%

curl -X POST ^
 https://api.github.com/graphql ^
 -H "accept: application/vnd.github+json" ^
 -H "authorization: Bearer %GIT_ACCESS_TOKEN%" ^
 -H "content-type: application/json" ^
 -H "x-github-api-version: 2022-11-28" ^
 -d "{\"query\":\"%graphql%\",\"variables\":\"%pars%\"}"

del %graphql_parameters_file%.tmp

goto completed





:completed