import 'package:flutter/material.dart';
import 'package:flutter_bl_dev/sendor_data.dart';

import 'device_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomeScreen(), routes: {
      '/sensor_data': (context) => SensorDataScreen(),
      '/device_configuration': (context) => DeviceConfigurationScreen(),
    });
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
      body: Stack(

        children: [
          AnimatedBackground(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/device_configuration');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
              ),
              child: Text('Get Started'),
            ),
          )
        ],
      ),
    );
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
}

class AnimatedBackground extends StatefulWidget {
  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground> {
  double _gradientAnimationRotation = 0;

  @override
  void initState() {
    super.initState();
   _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(Duration(milliseconds: 1), () {
      setState(() {
        _gradientAnimationRotation += 0.1;
        if (_gradientAnimationRotation >= 1) {
          _gradientAnimationRotation = 0;
        }
        _startAnimation();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(_gradientAnimationRotation * 2 * 3.14159),
          colors: [
       Colors.grey[200]!,
    Colors.grey[400]!,
    Colors.grey[600]!,
          ],
        ),
      ),
    );
  }
}
