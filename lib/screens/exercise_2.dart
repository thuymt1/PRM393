import 'package:flutter/material.dart';

class Exercise2 extends StatefulWidget {
  const Exercise2({super.key});

  @override
  State<Exercise2> createState() => _Exercise2State();
}

class _Exercise2State extends State<Exercise2> {
  double _sliderValue = 50.0;
  bool _isActive = false;
  String _selectedGenre = 'None';
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 - Input Controls')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Rating (Slider)', style: TextStyle(fontWeight: FontWeight.bold)),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() => _sliderValue = value);
              },
            ),
            Text('Current value: ${_sliderValue.round()}'),
            const Divider(height: 32),

            const Text('Active (Switch)', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Is movie active?'),
                Switch(
                  value: _isActive,
                  onChanged: (value) {
                    setState(() => _isActive = value);
                  },
                ),
              ],
            ),
            const Divider(height: 32),

            const Text('Genre (RadioListTile)', style: TextStyle(fontWeight: FontWeight.bold)),
            RadioListTile<String>(
              title: const Text('Action'),
              value: 'Action',
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() => _selectedGenre = value!);
              },
            ),
            RadioListTile<String>(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: _selectedGenre,
              onChanged: (value) {
                setState(() => _selectedGenre = value!);
              },
            ),
            Text('Selected genre: $_selectedGenre'),
            const Divider(height: 32),

            Center(
              child: ElevatedButton(
                onPressed: () => _pickDate(context),
                child: Text(_selectedDate == null
                    ? 'Open Date Picker'
                    : 'Selected: ${_selectedDate!.toLocal().toString().split(' ')[0]}'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}