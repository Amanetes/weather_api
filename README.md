# README

This is the simple Weather API application that shows weather based on location.
Location is fetched automatically according to your current IP address.

This application uses 'whenever gem' to update weather data at application startup and 1 hour update interval.

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
```html
/health - Returns API status
/current - Returns current temperature
/historical - Returns historical temperature for last 24 hours
/average - Returns average temperature for last 24 hours
/max - Returns maximum temperature for last 24 hours
/min - Returns minimum temperature for last 24 hours
/by_time?input=#{input_time} - Returns temperature by time input. Input time should be Integer value (example: 1658915880)
```