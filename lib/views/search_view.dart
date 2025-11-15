import 'package:e_commerce_app/helpers/cubit/product_by_id_cubit.dart';
import 'package:e_commerce_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Color(0xffffffff),
        title: const Text('Search'),
        centerTitle: true,
        backgroundColor: Color(0xff121212),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                context.read<ProductByIdCubit>().fetchProductById(
                  value.isEmpty ? 1 : int.parse(value),
                );
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search Products By Id',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            Gap(16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<ProductByIdCubit, ProductByIdState>(
                    builder: (context, state) {
                      if (state is ProductByIdLoaded) {
                        return ProductCard(product: state.product);
                      } else if (state is ProductByIdLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return Center(child: Text('No Product Found!'));
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
