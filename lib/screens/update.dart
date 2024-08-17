import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/anas_cubit.dart';
import 'package:storeapp/models/prod_model.dart';
import 'package:storeapp/widget/filwid.dart';

class update extends StatefulWidget {
  const update({super.key});
  static String id = 'up';

  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
  bool load = false;

  double? price;

  String? dc;

  String? Imag;

  String? name;
  @override
  Widget build(BuildContext context) {
    late prMod p = BlocProvider.of<AnasCubit>(context).n =
        ModalRoute.of(context)!.settings.arguments as prMod;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            cu(
              hint: "name",
              onChanged: (p0) {
                name = p0;
              },
            ),
            SizedBox(
              height: 20,
            ),
            cu(
              hint: "description",
              onChanged: (p1) {
                dc = p1;
              },
            ),
            SizedBox(
              height: 20,
            ),
            cu(
              inputt: TextInputType.number,
              hint: "price",
              onChanged: (p2) {
                price = double.parse(p2);
              },
            ),
            SizedBox(
              height: 20,
            ),
            cu(
              hint: "image",
              onChanged: (p3) {
                Imag = p3;
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(243, 255, 255, 255),
                textStyle: TextStyle(fontSize: 24),
                shadowColor: Color.fromARGB(255, 17, 1, 239),
                elevation: 20,
              ),
              child: load
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                            color: Color.fromARGB(234, 250, 247, 247)),
                        const SizedBox(
                          width: 24,
                          height: 58,
                        ),
                        Text('Please Wait..')
                      ],
                    )
                  : Text("data"),
              onPressed: () async {
                // print(name.runtimeType);
                // print(price.runtimeType);
                // print(Imag.runtimeType);
                // print(dc.runtimeType);

                BlocProvider.of<AnasCubit>(context).gpt(
                  title: name == null ? p.title.toString() : name!.toString(),
                  price:
                      price == null ? p.price!.toDouble() : price!.toDouble(),
                  id: p.id!.toInt(),
                  description:
                      dc == null ? p.description.toString() : dc!.toString(),
                  image: p.image.toString(),
                );
                for (int i = 0;
                    i < BlocProvider.of<AnasCubit>(context).pr.length;
                    i++) {
                  print(BlocProvider.of<AnasCubit>(context).pr[i].title);
                }
                // print(p.id.runtimeType);
                // await getpost().getpt(
                //   title: name == null ? p.title.toString() : name!.toString(),
                //   price:
                //       price == null ? p.price!.toDouble() : price!.toDouble(),
                //   id: p.id!.toInt(),
                //   description:
                //       dc == null ? p.description.toString() : dc!.toString(),
                //   image: p.image.toString(),
                // );
                // Navigator.pushNamed(context, update.id, arguments: prr);

                setState(() {
                  load = true;
                });
                BlocProvider.of<AnasCubit>(context).ref();

                Navigator.pop(context, true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
