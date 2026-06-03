from flask import Flask, render_template

app = Flask(__name__, template_folder='template', static_folder='static')

@app.route('/')

def home():
    return render_template('home.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    return render_template('login.html')    
    pass

@app.route('/register', methods=['GET', 'POST'])
def register():
    return render_template('registe.html')
@app.route('/menu')
def menu():
    return render_template('menu.html')

@app.route('/reservation')
def reservation():
    return render_template('reservation.html')

@app.route('/cart')
def cart():
    return render_template('cart.html')

if __name__ == '__main__':
    app.run(debug=True)