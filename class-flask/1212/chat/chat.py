from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)

# チャットメッセージを保存するリスト（メモリ内）
messages = []

@app.route("/")
def home():
    return render_template("chat.html", messages=messages)

@app.route("/send", methods=["POST"])
def send_message():
    username = request.form.get("username")
    message = request.form.get("message")
    if username and message:
        # メッセージを追加
        messages.append({"username": username, "message": message})
    return redirect(url_for("home"))

if __name__ == "__main__":
    app.run(debug=True)
