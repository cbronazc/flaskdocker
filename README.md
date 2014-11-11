Build container

`docker build -t flocker .`

Run tests

`docker run flocker python2.7 tests.py`

Run server

`docker run -p 5000:5000 flocker`

User `boot2docker ip` to see your ip address, then hit it at port 5000, for me: http://192.168.59.103:5000/
