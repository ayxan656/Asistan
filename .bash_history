print Hello World
world
/data/data/com.termux/files/usr/bin/hollywood 
pkg hollywood
hollywood
print Hello World
/data/data/com.termux/files/usr/bin/hollywood 
ls -la
ifconfig
pkg install hollywood
pip install flask
cat << 'EOF' > app.py
from flask import Flask, render_template_string, request
import requests

app = Flask(__name__)

# Çat səhifəsi üçün sadə dizayn (HTML/CSS)
HTML_TEMPLATE = """
<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Asistan</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f0f2f5; margin: 0; padding: 20px; display: flex; justify-content: center; }
        .chat-container { width: 100%; max-width: 600px; background: white; padding: 20px; border-radius: 12px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); }
        .chat-box { height: 400px; overflow-y: scroll; border: 1px solid #ddd; padding: 10px; margin-bottom: 15px; border-radius: 8px; background: #fafafa; }
        .message { margin-bottom: 10px; padding: 8px 12px; border-radius: 8px; max-width: 80%; }
        .user { background: #dcf8c6; margin-left: auto; text-align: right; }
        .bot { background: #e4e6eb; margin-right: auto; }
        form { display: flex; gap: 10px; }
        input { flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 6px; outline: none; }
        button { padding: 10px 20px; background: #0084ff; color: white; border: none; border-radius: 6px; cursor: pointer; }
        button:hover { background: #006dd3; }
    </style>
</head>
<body>
    <div class="chat-container">
        <h2>Süni İntellekt Asistanı</h2>
        <div class="chat-box" id="chatBox">
            {% if response %}
                <div class="message user"><b>Sən:</b> {{ user_input }}</div>
                <div class="message bot"><b>Asistan:</b> {{ response }}</div>
            {% endif %}
        </div>
        <form method="POST">
            <input type="text" name="sual" placeholder="Mesajınızı yazın..." required autocomplete="off">
            <button type="submit">Göndər</button>
        </form>
    </div>
</body>
</html>
"""

@app.route("/", methods=["GET", "POST"])
def home():
    response = ""
    user_input = ""
    if request.method == "POST":
        user_input = request.form.get("sual")
        tam_sual = f"Bütün cavabları səlis Azərbaycan dilində ver: {user_input}"
        url = f"https://text.pollinations.ai/{tam_sual}"
        try:
            res = requests.get(url)
            response = res.text
        except:
            response = "Xəta baş verdi."
    return render_template_string(HTML_TEMPLATE, response=response, user_input=user_input)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
EOF

python app.py
