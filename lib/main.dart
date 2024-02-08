import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remainder/cubit/cubitlogics.dart';
import 'package:remainder/cubit/cubits.dart';
import 'package:remainder/services/data_services.dart';
import 'package:remainder/ui/detail_pages/cubit/store_page_info_cubits.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(providers: [
          BlocProvider<AppCubits>(
            create: (context) => AppCubits(
              data: Dataservices(),
            ),
          ),
          BlocProvider<storepageinfocubits>(
            create: (context) => storepageinfocubits(),
          ),
        ], child: CubitLogics()));
  }
}
