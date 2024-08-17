import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:storeapp/cubit/anas_cubit.dart';

class cc extends StatefulWidget {
  const cc({super.key});

  @override
  State<cc> createState() => _ccState();
}

class _ccState extends State<cc> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        edgeOffset: 20,
        // Here we call that [RefreshEvent] in [RefreshBlocBloc]
        onRefresh: () async {
          // BlocProvider.of<AnasCubit>(context).getprid();
          await BlocProvider.of<AnasCubit>(context).ref();
        },
        child: BlocProvider.of<AnasCubit>(context).li());
  }
}
