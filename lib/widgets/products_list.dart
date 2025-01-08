import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/pages/product_detail_page.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  // List (array) of data which is here in this case is 4
  final List<String> filter = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectBrand;

  @override
  void initState() {
    super.initState();
    selectBrand = filter[0];
  }

  @override
  Widget build(BuildContext context) {
    // Border code is repeating in the border of textstyle as border and enabled
    // border so we've to create a seprate variable border
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(30),
      ),
    );

    // Filtering the products by comapny brand
    final filteredProducts = selectBrand == 'All'
        ? products
        : products.where((item) => item['company'] == selectBrand).toList();

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              itemCount: filter.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final label = filter[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectBrand = label;
                      });
                    },
                    child: Chip(
                      label: Text(label),
                      backgroundColor: selectBrand == label
                          ? Theme.of(context).colorScheme.primary
                          : Color.fromRGBO(245, 247, 249, 1),
                      labelStyle: TextStyle(
                        fontSize: 16,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      side: BorderSide(
                        color: Color.fromRGBO(221, 221, 221, 0.5),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];

                final title = product['title'];
                final price = product['price'];
                final image = product['imageUrl'];

                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ProductDetailsPage(product: product);
                      }),
                    );
                  },
                  child: ProductCard(
                    title: title as String,
                    price: price as double,
                    image: image as String,
                    index: index,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
