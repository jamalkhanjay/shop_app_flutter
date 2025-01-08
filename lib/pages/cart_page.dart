import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing the value of cart from Provider store
    // final cart = Provider.of<CartProvider>(context).cart;
    // alternative way or shortcut of the above LOC
    final cart = context.watch<CartProvider>().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(item['imageUrl'] as String),
            ),
            title: Text(
              item['title'].toString(),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            subtitle: Text(
              'Size: ${item['sizes']}',
              style: TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  // if barrierDismissle is false then the dialog box will not
                  // be hidden when a user click on the other area of screen (overlay)
                  // barrierDismissible: false,
                  context: context,
                  builder: (builder) {
                    return AlertDialog(
                      title: Text(
                        'Delete Product',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      content: Text('Are you sure you want to delete product?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Provider.of<CartProvider>(context, listen: false)
                            //     .removeFromCart(item);
                            // Alternative code for this provider is
                            context.read<CartProvider>().removeFromCart(item);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
