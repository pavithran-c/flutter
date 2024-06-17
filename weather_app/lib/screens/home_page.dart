import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Sample data
  final List<Map<String, dynamic>> forecastData = [
    {'day': 'Monday', 'temperature': '24°C', 'icon': Icons.wb_cloudy, 'color': Colors.grey},
    {'day': 'Tuesday', 'temperature': '22°C', 'icon': Icons.beach_access, 'color': Colors.blue},
    {'day': 'Wednesday', 'temperature': '26°C', 'icon': Icons.wb_sunny, 'color': Colors.yellow},
    {'day': 'Thursday', 'temperature': '23°C', 'icon': Icons.grain, 'color': Colors.brown},
    {'day': 'Friday', 'temperature': '25°C', 'icon': Icons.ac_unit, 'color': Colors.lightBlue},
    {'day': 'Saturday', 'temperature': '27°C', 'icon': Icons.wb_sunny, 'color': Colors.yellow},
    {'day': 'Sunday', 'temperature': '28°C', 'icon': Icons.wb_cloudy, 'color': Colors.grey},
  ];

  // Initial current weather data
  Map<String, dynamic> currentWeather = {
    'temperature': '27°C',
    'description': 'Sunny',
    'icon': Icons.wb_sunny,
    'color': Colors.yellow[700],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Current Weather',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 5),
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Icon(currentWeather['icon'], size: 48, color: currentWeather['color']),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        currentWeather['temperature'],
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        currentWeather['description'],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Forecast',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: forecastData.length,
                itemBuilder: (context, index) {
                  final item = forecastData[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentWeather = {
                          'temperature': item['temperature'],
                          'description': item['day'],
                          'icon': item['icon'],
                          'color': item['color'],
                        };
                      });
                    },
                    child: _buildForecastItem(
                      item['day'],
                      item['temperature'],
                      item['icon'],
                      item['color'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForecastItem(String day, String temperature, IconData icon, Color color) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, size: 36, color: color),
        title: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(temperature, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
