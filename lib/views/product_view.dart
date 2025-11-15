import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(product.image, height: 200, width: 200),
            ),
            Gap(16),
            Text(
              product.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(16),
            Text(product.description, style: const TextStyle(fontSize: 16)),
            Gap(16),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xff121212),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'Category: ${product.category.name}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Gap(16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff121212),
                foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Add To Cart'),
                  Gap(8),
                  Icon(Icons.add_shopping_cart),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
