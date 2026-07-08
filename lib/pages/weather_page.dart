import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final double temperature;
  final String condition;
  final int humidity;

  const WeatherCard({
    super.key,
    required this.city,
    required this.temperature,
    required this.condition,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    IconData weatherIcon;
    Color iconColor;

    switch (condition.toLowerCase()) {
      case 'sunny':
        weatherIcon = Icons.wb_sunny;
        iconColor = Colors.amber.shade700;
        break;
      case 'cloudy':
        weatherIcon = Icons.cloud;
        iconColor = Colors.blueGrey.shade400;
        break;
      case 'rainy':
        weatherIcon = Icons.water_drop;
        iconColor = Colors.blue.shade600;
        break;
      default:
        weatherIcon = Icons.help_outline;
        iconColor = Colors.grey;
    }

    return Card(
      elevation: 4,
      shadowColor: Colors.blue.withOpacity(0.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.blue.shade100, width: 1.5),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              city,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${temperature.toStringAsFixed(1)}°C',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue.shade900,
                    letterSpacing: -1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(weatherIcon, size: 44, color: iconColor),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.blue.shade50, thickness: 1.5),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.water_drop,
                      size: 20,
                      color: Colors.blue.shade400,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'ความชื้น: $humidity%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey.shade700,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    condition.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: WeatherCard(
            city: 'Bangkok',
            temperature: 32.5,
            condition: 'sunny',
            humidity: 55,
          ),
        ),
      ),
    );
  }
}
