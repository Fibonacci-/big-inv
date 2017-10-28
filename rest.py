from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return "Hello world!"

@app.route('/apiecho')
def apiecho():
    return "the results of a sql query"

if __name__ == '__main__':
    app.run(debug=True)
