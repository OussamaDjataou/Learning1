from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    app.run(host="0.0.0.0", port=3000)
    return "<p>Hello, World!</p>"