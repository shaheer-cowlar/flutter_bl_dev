import 'package:flutter/material.dart';

class DeviceConfigurationScreen extends StatefulWidget {
  @override
  _DeviceConfigurationScreenState createState() =>
      _DeviceConfigurationScreenState();
}

class _DeviceConfigurationScreenState extends State<DeviceConfigurationScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _deviceIDController = TextEditingController();
  TextEditingController _deviceMacController = TextEditingController();

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Saving...', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pop(context); // Close the dialog
      Navigator.pushReplacementNamed(
          context, '/sensor_data'); // Navigate to SensorDataScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F474B),
      appBar: AppBar(
        backgroundColor: Color(0xFF272727),
        title: Text('Device Configuration',style: TextStyle(color: Colors.white)),
      ),
      body: Container(
    
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: _deviceIDController,
                  decoration: InputDecoration(labelText: 'Device ID'),
                ),
                TextField(
                  controller: _deviceMacController,
                  decoration: InputDecoration(labelText: 'Device Mac'),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
ElevatedButton(
  onPressed: () {
    _showLoadingDialog(context);
  },
  style: ElevatedButton.styleFrom(
    primary: Color(0xFF87C3D0), // Background color
    onPrimary: Color(0xFF1E1E1E), // Text color
  ),
  child: Text('Save'),
),
SizedBox(width: 20),
ElevatedButton(
  onPressed: () {
    _nameController.clear();
    _deviceIDController.clear();
    _deviceMacController.clear();
  },
  style: ElevatedButton.styleFrom(
    primary: Color(0xFF87C3D0), // Background color
    onPrimary: Color(0xFF1E1E1E), // Text color
  ),
  child: Text('Clear'),
),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
