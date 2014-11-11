Build container

`docker build -t flocker .`

Run tests

`docker run flocker python2.7 tests.py`

Run server

`docker run -p 5000:5000 flocker`
