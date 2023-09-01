import 'package:flutter/material.dart';
import 'dart:math';

class SensorDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sensor Data',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
                 Colors.grey[200]!,
    Colors.grey[400]!,
    Colors.grey[600]!, ],
          ),
        ),
        child: Center(
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
          DataCell(Text(sensorName,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
          DataCell(Text(sensorValue.toStringAsFixed(1),
              style: TextStyle(color: Colors.white))),
        ],
      );
    }).toList();
  }

  double _generateRandomValue() {
    return random.nextDouble() *
        100; // Generating random value between 0 and 100
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.black,
        child: DataTable(
          columns: [
            DataColumn(
                label: Text('Sensor',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(
                label: Text('Value',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white))),
          ],
          rows: _buildRows(),
        ),
      ),
    );
  }
}
