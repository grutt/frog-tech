from flask import Flask
import time
import os

app = Flask(__name__)

@app.route('/')
def unixTime():
    return str(int(time.time()))

if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
