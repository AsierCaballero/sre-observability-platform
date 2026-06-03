import os
import time
import random
from flask import Flask, jsonify, request, Response
from prometheus_client import Counter, Histogram, Gauge, generate_latest, CONTENT_TYPE_LATEST

app = Flask(__name__)

REQUEST_COUNT = Counter('http_requests_total', 'Total requests', ['method', 'status', 'endpoint'])
REQUEST_DURATION = Histogram('http_request_duration_seconds', 'Request duration', ['method', 'endpoint'],
                             buckets=[0.01, 0.05, 0.1, 0.25, 0.5, 1.0, 2.5, 5.0])
ACTIVE_REQUESTS = Gauge('http_requests_active', 'Active requests', ['endpoint'])

@app.before_request
def before_request():
    ACTIVE_REQUESTS.labels(endpoint=request.endpoint or 'unknown').inc()

@app.after_request
def after_request(response):
    ACTIVE_REQUESTS.labels(endpoint=request.endpoint or 'unknown').dec()
    REQUEST_COUNT.labels(method=request.method, status=response.status_code,
                         endpoint=request.endpoint or 'unknown').inc()
    return response

@app.route('/health')
def health():
    return jsonify({'status': 'healthy'})

@app.route('/ready')
def ready():
    return jsonify({'ready': True})

@app.route('/api/v1/users')
def list_users():
    time.sleep(random.uniform(0.01, 0.1))
    return jsonify({'users': [{'id': 1, 'name': 'Alice'}, {'id': 2, 'name': 'Bob'}]})

@app.route('/api/v1/products')
def list_products():
    time.sleep(random.uniform(0.05, 0.3))
    products = [
        {'id': 1, 'name': 'Widget', 'price': 29.99},
        {'id': 2, 'name': 'Gadget', 'price': 49.99}
    ]
    return jsonify({'products': products})

@app.route('/api/v1/orders', methods=['POST'])
def create_order():
    time.sleep(random.uniform(0.1, 0.5))
    return jsonify({'order_id': random.randint(1000, 9999), 'status': 'created'}), 201

@app.route('/api/v1/errors')
def simulate_errors():
    if random.random() < 0.3:
        return jsonify({'error': 'simulated error'}), 500
    return jsonify({'status': 'ok'})

@app.route('/metrics')
def metrics():
    return Response(generate_latest(), mimetype=CONTENT_TYPE_LATEST)

if __name__ == '__main__':
    port = int(os.getenv('PORT', 8080))
    app.run(host='0.0.0.0', port=port)