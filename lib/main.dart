import 'package:flutter/material.dart';
import 'package:flutter_bl_dev/sendor_data.dart';

import 'device_config.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Display SplashScreen initially
      routes: {
        '/my_home_screen': (context) => MyHomeScreen(),
         '/sensor_data': (context) => SensorDataScreen(),
      '/device_configuration': (context) => DeviceConfigurationScreen(),

      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay for 3 seconds and then navigate to MyHomeScreen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/my_home_screen');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.jpg'), // Your logo image
            SizedBox(height: 16), // Add spacing
            CircularProgressIndicator(), // Circular progress indicator
          ],
        ),
      ),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF4F474B), // Background color
      body: Stack(
        children: [
         
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/device_configuration');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF87C3D0), // Background color
                onPrimary: Color(0xFF1E1E1E), // Text color
              ),
              child: Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}

  void _showWelcomeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Welcome'),
          content: Text('Enjoy using our app!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }






