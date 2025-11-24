::https://www.videlibri.de/xidel.html
::https://github.com/benibela/xidel
@cls
xidel --help
curl --silent -X GET "https://httpbin.org/html" | xidel - --silent --extract "//html//body//h1//text()"
@pause