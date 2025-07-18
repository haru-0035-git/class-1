from flask import Flask, render_template

# ==================================================
# インスタンス生成
# ==================================================
app = Flask(__name__)

# ==================================================
# ルーティング
# ==================================================
# TOPページ
@app.route('/') 
def index():
    return render_template('top.html')

# 一覧
@app.route('/list') 
def item_list():
    return render_template('list.html')

# 詳細
# ▼▼▼【リスト3.14】▼▼▼
@app.route('/detail/<int:id>')
def item_detail(id):
    return render_template('detail.html', show_id=id)
# ▲▲▲【リスト3.14】▲▲▲

# ==================================================
# 実行
# ==================================================
if __name__ == '__main__':
    app.run()