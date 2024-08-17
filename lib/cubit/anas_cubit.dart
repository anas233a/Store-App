import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/models/prod_model.dart';
import 'package:storeapp/service/getpropost.dart';
import 'package:storeapp/service/prod.dart';
import 'package:storeapp/widget/anas.dart';

import 'anas_state.dart';

class AnasCubit extends Cubit<blocs> {
  AnasCubit(this.n) : super(storinti());
  List<prMod> pr = [];
  prMod n;
  Map<String, dynamic> b = {};
  Future<void> ref() async {
    emit(loadg());

    // During the Loading state we can do additional checks like,
    // if the internet connection is available or not etc..
    await Future.delayed(
      Duration(seconds: 4),
    ); // This is to simulate that refresh process
    getprid();
    emit(loaded());
  }

  void getprid() async {
    if (pr.isEmpty == true) {
      emit(storlo());
      pr = await GetAllprod.getAllprodu();
    }
    if (pr.isEmpty == false) {
      emit(storscss());
    } else
      emit(storfal());
  }

  Future<void> gpt(
      {required String title,
      required double price,
      required int id,
      required String description,
      required String image}) async {
    if (pr.isEmpty == false) {
      for (int i = 0; i < pr.length; i++) {
        if (id == pr[i].id) {
          b = await getpost().getpt(
              title: title,
              price: price,
              id: id,
              description: description,
              image: image) as Map<String, dynamic>;
          n.title = b["title"];
          n.price = b["price"];
          n.id = b["id"];
          n.description = b["description"];
          n.image = b["image"];
          pr.add(n);
        }
      }
      emit(storup());
    }
    if (pr.isEmpty == true) {}
    emit(storgg());
  }

  Widget li() {
    return GridView.builder(
        clipBehavior: Clip.none,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.52),
        itemCount: pr.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(48.0),
            child: anas(pr: pr[index]),
          );
        });
  }

  @override
  void onChange(Change<blocs> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
