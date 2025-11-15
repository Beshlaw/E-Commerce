import 'package:e_commerce_app/helpers/cubit/all_product_cubit.dart';
import 'package:e_commerce_app/helpers/cubit/product_by_id_cubit.dart';
import 'package:e_commerce_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AllProductCubit()),
        BlocProvider(create: (context) => ProductByIdCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commmerce',
        home: HomeView(),
      ),
    );
  }
}
