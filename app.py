import redis
from flask import Flask, request

app = Flask(__name__)
# Connect to the Redis cluster
cache = redis.Redis(host='redis-cluster.abcdef.ng.0001.use1.cache.amazonaws.com', port=6379)

@app.route('/data')
def get_data():
    key = 'some_unique_key'  # Define a unique key for caching
    if cache.exists(key):    # Check if the key exists in cache
        return cache.get(key)  # Return the cached data
    else:
        data = fetch_data_from_database()  # Fetch data from database
        cache.set(key, data, ex=60*60)  # Cache data for 1 hour
        return data

def fetch_data_from_database():
    # Simulated database fetch
    return {"data": "This is the data from the database"}

if __name__ == "__main__":
    app.run(debug=True)  # Run the Flask app
