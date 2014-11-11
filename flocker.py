from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return "<html><body><img src='http://i1.kym-cdn.com/entries/icons/original/000/007/447/hello-yes-this-is-dog.png'></body></html>"

if __name__ == '__main__':
    app.run(host='0.0.0.0')

