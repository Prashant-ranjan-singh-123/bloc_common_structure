import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class DatePickerWithHead extends StatefulWidget {
  final String heading;
  final String hintText;
  String? myDate;
  final TextEditingController controller;
  final bool enable;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  Function(String)? onChange;

  DatePickerWithHead(
      {super.key,
      required this.heading,
      required this.hintText,
      required this.controller,
      this.enable = true,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.myDate,
      this.onChange});

  @override
  _DatePickerWithHeadState createState() => _DatePickerWithHeadState();
}

class _DatePickerWithHeadState extends State<DatePickerWithHead> {
  @override
  void initState() {
    if (widget.myDate != null) {
      widget.controller.text = widget.myDate!;
    } else {
      final format = DateFormat('yyyy-MM-dd');
      String date = format.format(DateTime.now());
      widget.controller.text = date;
    }
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initialDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(2018),
      lastDate: widget.lastDate ?? DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        var formattedDate = pickedDate
            .toIso8601String()
            .split('T')
            .first; // Format as YYYY-MM-DD

        widget.controller.text = formattedDate;
        widget.myDate = formattedDate; // Ensure this updates correctly

        print(widget.onChange);
        if (widget.onChange != null) {
          widget.onChange!(formattedDate); // Ensure callback is triggered
        }
      });
    }
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: widget.initialDate ?? DateTime.now(),
  //     firstDate: widget.firstDate ?? DateTime(2018),
  //     lastDate: widget.lastDate ?? DateTime.now(),
  //   );
  //   if (pickedDate != null) {
  //     setState(() {
  //       var formattedDate = pickedDate
  //           .toIso8601String()
  //           .split('T')
  //           .first; // Format as YYYY-MM-DD
  //
  //       widget.controller.text = formattedDate;
  //       widget.myDate = formattedDate; // Ensure this updates correctly
  //
  //       // Debugging: Print the callback
  //       print('onChange callback: ${widget.onChange}');
  //
  //       // Ensure the callback is not null before invoking it
  //       if (widget.onChange != null) {
  //         widget.onChange!(formattedDate); // Trigger the callback
  //       } else {
  //         print('onChange callback is null');
  //       }
  //     });
  //   }
  // }

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
          enabled: widget.enable,
          onTap: () => _selectDate(context),
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
            prefixIcon: const Icon(IconlyBold.calendar, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
