import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:iconly/iconly.dart'; // Ensure this package is added to your pubspec.yaml

class TimePickerWithHead extends StatefulWidget {
  final String heading;
  final String hintText;
  final TextEditingController controller;

  const TimePickerWithHead({
    super.key,
    required this.heading,
    required this.hintText,
    required this.controller,
  });

  @override
  _TimePickerWithDialogState createState() => _TimePickerWithDialogState();
}

class _TimePickerWithDialogState extends State<TimePickerWithHead> {
  Time _time = Time(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          readOnly: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w300),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1.5,
                color: Colors.black,
              ),
            ),
            prefixIcon: const Icon(IconlyBold.time_square, color: Colors.grey),
          ),
          onTap: () => _showPicker(context),
        ),
      ],
    );
  }

  void _showPicker(BuildContext context) {
    Navigator.of(context).push(
      showPicker(
        context: context,
        value: _time,
        sunrise: const TimeOfDay(hour: 6, minute: 0), // optional
        sunset: const TimeOfDay(hour: 18, minute: 0), // optional
        onChange: (time) {
          setState(() {
            _time = time;
            widget.controller.text = _formatTime(_time); // Updates TextField
          });
        },
        is24HrFormat: false, // Enable 24-hour format
        amLabel: 'AM', // Optional: Customize AM label
        pmLabel: 'PM', // Optional: Customize PM label
        displayHeader: true, // Show header for time selection
      ),
    );
  }

  String _formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime =
        DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';
  }
}
