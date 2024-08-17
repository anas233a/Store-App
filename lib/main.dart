import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/anas_cubit.dart';
import 'package:storeapp/models/prod_model.dart';
import 'package:storeapp/screens/homepage.dart';
import 'package:storeapp/screens/update.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    prMod p = prMod.ds();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AnasCubit(p),
        ),
      ],
      child: MaterialApp(
        initialRoute: MyWidget.id,
        routes: {
          MyWidget.id: (context) => MyWidget(),
          update.id: (context) => update()
        },
      ),
    );
  }
}
