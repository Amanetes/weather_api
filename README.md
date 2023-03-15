# README

This is the simple Weather API application that shows weather based on location.
Location is fetched automatically according to your current IP address.

Actual weather conditions is fetched every 3 hours.

All requests to API are throttled to 60rpm.

1. Clone this project using:
```bash
git clone
```

2. Setup .env file using:
```bash
  make setup
```

3. Use provided link to register an application to get your own private API_KEY.
```bash
  https://developer.accuweather.com/
```

4. Copy generated API_KEY to .env file

5. Start the server by using
```ruby
  rails s
```

6. Endpoint reference :
```bash
GET / redirects to /api/v1/current, see below for reference
GET /api/v1/health - Returns API status
GET /api/v1/current - Returns current temperature
GET /api/v1/historical - Returns historical temperature for last 24 hours
GET /api/v1/historical/average - Returns average temperature for last 24 hours
GET /api/v1/historical/max - Returns maximum temperature for last 24 hours
GET /api/v1/historical/min - Returns minimum temperature for last 24 hours
GET /api/v1/by_time?input={input_time} - Returns temperature by time input. Input time should be Integer value (example: 1658915880)
```
