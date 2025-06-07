from flask import Flask, render_template
from dotenv import load_dotenv
import os

load_dotenv()
app = Flask(__name__)
app.secret_key = os.getenv("FLASK_SECRET_KEY", "fallback-key")

@app.route("/", methods=["GET"])
def index():
    mapbox_key = os.getenv("MAPBOX_API_KEY", "")
    return render_template("index.html", mapbox_key=mapbox_key)

if __name__ == "__main__":
    app.run()
