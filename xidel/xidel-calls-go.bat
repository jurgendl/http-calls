::https://www.videlibri.de/xidel.html
@cls
xidel --help
curl --silent -X GET "https://httpbingo.org/html" | xidel - --silent --extract "//html//body//h1//text()"
@pause