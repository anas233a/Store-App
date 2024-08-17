import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/getwidget.dart';

class st extends StatefulWidget {
  const st({super.key});

  @override
  State<st> createState() => _stState();
}

class _stState extends State<st> {
  double _iconRating = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GFRating(
        color: Color.fromARGB(255, 244, 200, 4),
        borderColor: const Color.fromARGB(255, 244, 200, 4),
        filledIcon: Icon(
          Icons.check,
          color: Color.fromARGB(255, 244, 200, 4),
        ),
        size: GFSize.SMALL,
        value: _iconRating,
        onChanged: (value) {
          setState(() {
            _iconRating = value;
          });
        },
      ),
    );
  }
}
