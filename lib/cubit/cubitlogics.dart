import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remainder/cubit/cubit_states.dart';
import 'package:remainder/cubit/cubits.dart';
import 'package:remainder/ui/detail_pages/detailpage.dart';
import 'package:remainder/ui/navpages/mainpage.dart';
import 'package:remainder/ui/welcomepage.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({super.key});

  @override
  State<CubitLogics> createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, states) {
        if (states is WelcomeState) {
          return WelcomePage();
        }
        if (states is LoadedState) {
          return Mainpage();
        }
        if (states is DetailState) {
          return Detailpage();
        }
        if (states is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
