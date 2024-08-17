import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/anas_cubit.dart';
import 'package:storeapp/cubit/anas_state.dart';
import 'package:storeapp/screens/cc.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  static String id = "homepage";
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  bool b = false;
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AnasCubit>(context).getprid();
    return Scaffold(
      backgroundColor: Color.fromARGB(239, 24, 24, 24),
      appBar: AppBar(
        actions: [],
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 120,
        elevation: 0,
        title: Center(
          child: Text(
            "New trinding",
            style: TextStyle(color: Color.fromARGB(244, 250, 247, 247)),
          ),
        ),
      ),
      body: BlocBuilder<AnasCubit, blocs>(builder: (context, state) {
        if (state is storlo) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ));
        } else if (state is loadg) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is loaded) {
          return cc();
        } else if (state is storup) {
          Container(child: BlocProvider.of<AnasCubit>(context).li());
        } else if (state is storgg) {
          return Center();
        } else if (state is storscss) {
          return Container(child: BlocProvider.of<AnasCubit>(context).li());
        }

        if (state is storfal) {
          return Center(child: Text("eae"));
        } else
          return Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 0, 21, 255),
            ),
          );
      }),
    );
  }
}
 // if (state is storinti) {
        //   return Center(
        //       child: CircularProgressIndicator(
        //     color: Colors.black,
        //   ));
        // } else
        //   return Center(child: Text("sfsf",style: TextSt,));