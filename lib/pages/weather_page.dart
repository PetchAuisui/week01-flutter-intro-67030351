import 'package:flutter/material.dart';

/// WeatherCard - StatelessWidget แสดงข้อมูลสภาพอากาศด้วย Material 3
class WeatherCard extends StatelessWidget {
  // ประกาศตัวแปรรับค่าผ่าน Constructor (Read-Only)
  final String cityName;
  final double temperature;
  final String condition; // 'sunny', 'cloudy', หรือ 'rainy'
  final double humidity;

  const WeatherCard({
    super.key,
    required this.cityName,
    required this.temperature,
    required this.condition,
    required this.humidity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // กำหนดรายละเอียดไอคอนตามประเภทสภาพอากาศ
    IconData weatherIcon;
    Color iconColor;

    switch (condition.toLowerCase()) {
      case 'sunny':
        weatherIcon = Icons.wb_sunny_rounded;
        iconColor = Colors.amber.shade700;
        break;
      case 'cloudy':
        weatherIcon = Icons.wb_cloudy_rounded;
        iconColor = Colors.blueGrey.shade500;
        break;
      case 'rainy':
        weatherIcon = Icons.umbrella_rounded;
        iconColor = Colors.blue.shade600;
        break;
      default:
        weatherIcon = Icons.help_outline_rounded;
        iconColor = colorScheme.onSurfaceVariant;
    }

    return Card(
      elevation: 0, // สไตล์ Material 3 นิยมลดการใช้เงาหนาและใช้ขอบแทน
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colorScheme.outlineVariant, width: 1.0),
        borderRadius: BorderRadius.circular(16.0), // ขอบโค้งสไตล์ M3
      ),
      color: colorScheme.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. ชื่อเมือง
            Text(
              cityName,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),

            // 2. แถวแสดงอุณหภูมิและไอคอน
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${temperature.toStringAsFixed(1)}°C',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHigh,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(weatherIcon, size: 40, color: iconColor),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Divider(color: colorScheme.outlineVariant, height: 1),
            const SizedBox(height: 16),

            // 3. แถวข้อมูลความชื้นและข้อมูลสรุป
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.water_drop_outlined,
                      size: 18,
                      color: colorScheme.primary,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'ความชื้น: ${humidity.toStringAsFixed(0)}%',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                Text(
                  condition.toUpperCase(),
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
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
            cityName: 'Bangkok',
            temperature: 32.5,
            condition: 'sunny',
            humidity: 55.0,
          ),
        ),
      ),
    );
  }
}
