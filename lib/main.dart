import 'package:e_commerce_app/helpers/cubit/all_product_cubit.dart';
import 'package:e_commerce_app/helpers/cubit/cart_cubit.dart';
import 'package:e_commerce_app/helpers/cubit/product_by_id_cubit.dart';
import 'package:e_commerce_app/models/cart_item_model.dart';
import 'package:e_commerce_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemModelAdapter());
  await Hive.openBox<CartItemModel>('cartBox');
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
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commmerce',
        home: HomeView(),
      ),
    );
  }
}
