import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class cu extends StatefulWidget {
  cu({required this.hint, this.inputt, required this.onChanged, this.va});
  final String? hint;
  Function(String)? onChanged;
  TextInputType? inputt;
  String? Function(String?)? va;
  @override
  State<cu> createState() => _cuState();
}

class _cuState extends State<cu> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.inputt,
      style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: widget.hint!,
        focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: const Color.fromARGB(255, 186, 34, 34))),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(
              color: Color.fromARGB(214, 195, 227, 13), strokeAlign: 1),
        ),
      ),
    );
  }
}
