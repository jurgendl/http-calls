@echo off

setlocal enabledelayedexpansion

For /F "tokens=1* delims==" %%A IN (.env) DO (
    IF "%%A"=="GIT_ACCESS_TOKEN" set GIT_ACCESS_TOKEN=%%B
)

:: https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues
:: https://medium.com/swlh/introduction-to-graphql-with-github-api-64ee8bb11630
:: https://jscomplete.com/learn/complete-intro-graphql/1g-examples-github

:: "{\"query\":\"{ viewer { repositories(last: 10) { nodes { name description } } } }\"}"
set "graphql="
for /f "delims=" %%a in (last_10_repositories_viewed.graphql) do (
    set "line=%%a"
    set "graphql=!graphql! !line!"
)
echo "%graphql%"

::echo curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer %GIT_ACCESS_TOKEN%" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/graphql --data "{\"query\":\" {viewer{repositories(last:10){nodes{name description}}}} \"}"

echo curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer %GIT_ACCESS_TOKEN%" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/graphql --data "{\"query\":\" %graphql% \"}"
curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer %GIT_ACCESS_TOKEN%" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/graphql --data "{\"query\":\" %graphql% \"}"

endlocal
