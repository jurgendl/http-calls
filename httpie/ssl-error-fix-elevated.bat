::http: error: SSLError: HTTPSConnectionPool(host='httpbin.org', port=443): Max retries exceeded with url: /get (Caused by SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: unable to get local issuer certificate (_ssl.c:1018)'))) while doing a GET request to URL: https://httpbin.org/
::https://raw.githubusercontent.com/certifi/python-certifi/refs/heads/master/certifi/cacert.pem

@echo off
cls
echo update Python
echo -- or --
echo download up to date cacert.pem from
echo https://raw.githubusercontent.com/certifi/python-certifi/refs/heads/master/certifi/cacert.pem
echo and replace
python -c "import certifi; print(certifi.where())"
echo -- or --
echo install the latest versie of httpie:
echo pip install -U https://github.com/jkbr/httpie/tarball/master
echo -- or --
echo update python certifi in elevated mode:
echo python -m pip install --upgrade certifi
pause
