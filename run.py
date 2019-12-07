from flask import Flask, request, jsonify
import psycopg2

app = Flask(__name__)

conn = psycopg2.connect(
    host='localhost',
    port=5450,
    dbname='mydb',
    user='postgres',
    password='password'
)

cur = conn.cursor()
def insertCustomer(id,firstname,lastname,city,country,phone):
    cur.execute("INSERT into customer('id,firstname,lastname,city,country,phone') values(%s,%s,%s,%s,%s)")
    conn.commit()

@app.route('/')
def init():
    return 'Hello, World!'

@app.route('/customer', methods=['POST'])
def create():
    if request.method == 'POST':
       data = request.get_json()
       insertCustomer(data['id'],data['firstname'],data['lastname'],data['city'],data['country'],data['phone'])
    return jsonify({'success':'customer inserted successfully'})

app.run

cur.execute("SELECT * FROM product;")
result = cur.fetchall()
print(result)
cur.close()
conn.close()
