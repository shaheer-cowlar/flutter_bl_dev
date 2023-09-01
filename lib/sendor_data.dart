import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SensorDataScreen(),
    );
  }
}

class SensorDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F474B),
      appBar: AppBar(
       backgroundColor: 
       Color(0xFF272727),
        title: Text(
          'Sensor Data',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
           // Background color
          child: SensorDataTable(),
        ),
      ),
    );
  }
}

class SensorDataTable extends StatelessWidget {
  final List<String> sensorNames = [
    'SP1',
    'SP2',
    'SP3',
    'SP4',
    'SP5',
    'SP6',
    'SP7',
    'VDC'
  ];
  final Random random = Random();

  List<DataRow> _buildRows() {
    return sensorNames.map((sensorName) {
      final double sensorValue = _generateRandomValue();
      return DataRow(
        cells: [
          DataCell(
            Text(
              sensorName,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          DataCell(
            Text(
              sensorValue.toStringAsFixed(1),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    }).toList();
  }

  double _generateRandomValue() {
    return random.nextDouble() *
        100; // Generating a random value between 0 and 100
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: [
          DataColumn(
            label: Text(
              'Sensor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Value',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
        rows: _buildRows(),
      ),
    );
  }
}
