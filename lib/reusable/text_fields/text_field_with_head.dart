import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class TextFieldWithHead extends StatefulWidget {
  final String heading;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int minLines;
  Iterable<String>? autoFill;
  final bool enabled;
  final Function(String str) onChange;
  final bool show_suffix;
  final bool isPasswordField;

  TextFieldWithHead({
    super.key,
    required this.heading,
    required this.hintText,
    required this.controller,
    this.onChange = defaultOnChange,
    this.autoFill= const <String>[],
    this.keyboardType = TextInputType.text,
    this.minLines = 1,
    this.enabled = true,
    this.show_suffix = true,
    this.isPasswordField = false,
  });

  static void defaultOnChange(String str) {}

  @override
  _TextFieldWithHeadState createState() => _TextFieldWithHeadState();
}

class _TextFieldWithHeadState extends State<TextFieldWithHead> {
  bool _isObscure = true;

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
          maxLines: widget.minLines,
          keyboardType: widget.keyboardType,
          enabled: widget.enabled,
          obscureText: widget.isPasswordField ? _isObscure : false,
          onChanged: (String str) {
            widget.onChange(str);
          },
          autofillHints: widget.autoFill,
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
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  )
                : widget.show_suffix
                    ? const Icon(
                        IconlyBold.edit,
                        color: Colors.grey,
                      )
                    : null,
          ),
        ),
      ],
    );
  }
}
