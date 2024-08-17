import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:storeapp/models/prod_model.dart';
import 'package:storeapp/screens/update.dart';

class anas extends StatefulWidget {
  anas({required this.pr});
  final prMod? pr;

  @override
  State<anas> createState() => _anasState();
}

class _anasState extends State<anas> {
  double _iconRating = 0;
  bool an = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 50,
                  spreadRadius: 20,
                  offset: Offset(
                    1,
                    1,
                  )),
            ]),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, update.id, arguments: widget.pr!);
              },
              child: Card(
                clipBehavior: Clip.none,
                elevation: 20,
                color: Color.fromARGB(215, 65, 62, 62),
                child: Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.pr!.title.toString(),
                        style: TextStyle(
                            fontSize: 26,
                            color: const Color.fromARGB(244, 255, 255, 255)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' + widget.pr!.price.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 244, 200, 4)),
                          ),
                          if (an != true)
                            GFRating(
                              color: Color.fromARGB(255, 244, 200, 4),
                              borderColor:
                                  const Color.fromARGB(255, 244, 200, 4),
                              filledIcon: Icon(
                                Icons.check,
                                color: Color.fromARGB(255, 244, 200, 4),
                              ),
                              size: GFSize.SMALL,
                              value: _iconRating,
                              onChanged: (value) {
                                setState(() {
                                  if (_iconRating == 5) {
                                    an = true;

                                    _iconRating = value;
                                  } else
                                    _iconRating = value;
                                });
                                print(an);
                              },
                            ),
                          if (an != false)
                            IconButton(
                              style: ButtonStyle(),
                              onPressed: () {
                                setState(() {
                                  an = false;
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            )
                          else
                            Center()
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 200,
            right: 192,
            child: Image.network(
              widget.pr!.image.toString(),
              height: 290,
              width: 270,
            ),
          ),
        ],
      ),
    );
  }
}
