import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DropdownWithHead extends StatefulWidget {
  final String heading;
  final String hintText;
  bool showHead;
  final bool enable;
  final TextEditingController controller;
  final Function()? fun;
  final List<String> items;
  String? selectItem;

  DropdownWithHead({
    super.key,
    required this.heading,
    required this.hintText,
    this.fun,
    this.showHead = true,
    this.selectItem,
    required this.controller,
    this.enable = true,
    required this.items,
  });

  @override
  _DropdownWithHeadState createState() => _DropdownWithHeadState();
}

class _DropdownWithHeadState extends State<DropdownWithHead> {
  String? _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.selectItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showHead
            ? Text(
          widget.heading,
          style: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
        )
            : const SizedBox(),
        widget.showHead ? const SizedBox(height: 8) : const SizedBox(),
        AbsorbPointer(
          absorbing: !widget.enable,
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            value: _selectedItem,
            style: widget.enable
                ? const TextStyle(color: Colors.black)
                : TextStyle(color: Colors.grey.shade500),
            decoration: InputDecoration(
              contentPadding:
              const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              labelText: widget.hintText,
              prefixIcon: const Icon(IconlyBold.filter, color: Colors.grey),
              labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.grey,
                ),
              ),
              enabledBorder: widget.enable
                  ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.grey,
                ),
              )
                  : OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  width: 1.5,
                  color: Colors.grey.shade200,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 1.5,
                  color: Colors.black,
                ),
              ),
            ),
            items: widget.items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue;
                widget.controller.text = newValue ?? '';
              });
              if (widget.fun != null) {
                widget.fun!();
              }
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select an item';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}