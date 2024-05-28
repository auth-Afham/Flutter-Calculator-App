import 'dart:convert'; // For JSON encoding and decoding
import 'package:flutter/material.dart'; // Flutter UI framework
import 'package:http/http.dart' as http; // HTTP package for making API calls

void main() {
  runApp(WeatherApp()); // Entry point of the application
}

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState(); // Creates the mutable state for the WeatherApp
}

class _WeatherAppState extends State<WeatherApp> {
  String _cityName = 'Kuala Lumpur'; // Default city name
  String _temperature = ''; // Variable to store the temperature
  String _description = ''; // Variable to store the weather description
  String _icon = ''; // Variable to store the URL of the weather icon

  @override
  void initState() {
    super.initState();
    _fetchWeatherData(); // Fetch weather data when the app starts
  }

  Future<void> _fetchWeatherData() async {
    final apiKey = 'f6eb3a577a41897e081ff0c5cdcfc468'; // Replace with your actual API key
    final apiUrl =
        // 'https://api.openweathermap.org/data/2.5/weather?q=$_cityName&appid=$apiKey&units=metric';
        'https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&exclude=hourly,daily&appid=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl)); // Make the API call
      if (response.statusCode == 200) {
        // Check if the response is successful
        final data = jsonDecode(response.body); // Decode the JSON response
        setState(() {
          // Update the state with the fetched data
          _temperature = '${data['main']['temp']}°C';
          _description = data['weather'][0]['description'];
          _icon = 'https://openweathermap.org/img/w/${data['weather'][0]['icon']}.png';
        });
      } else {
        print('Failed to fetch weather data'); // Handle unsuccessful response
      }
    } catch (e) {
      print('Error: $e'); // Handle any errors that occur during the API call
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App', // Title of the app
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'), // Title displayed in the app bar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _cityName, // Display the city name
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16), // Space between elements
              Image.network(_icon, width: 100, height: 100), // Display the weather icon
              SizedBox(height: 16), // Space between elements
              Text(
                _temperature, // Display the temperature
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16), // Space between elements
              Text(
                _description, // Display the weather description
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
