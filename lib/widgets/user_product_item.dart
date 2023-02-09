import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              color: Theme.of(context).colorScheme.primary,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // try {
                //   await Provider.of<Products>(context, listen: false)
                //       .deleteProduct(id);
                // } catch (error) {
                //   scaffoldMessenger.showSnackBar(
                //     SnackBar(
                //       content: Text('Deleting failed!'),
                //     ),
                //   );
                // }
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text('Are you sure?'),
                          content: Text('Do you want to delete this product?'),
                          actions: [
                            TextButton(
                              child: Text('No'),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            ),
                            TextButton(
                              child: Text('Yes'),
                              onPressed: () async {
                                await Provider.of<Products>(context,
                                        listen: false)
                                    .deleteProduct(id);
                                Navigator.of(ctx).pop(true);
                              },
                            ),
                          ],
                        ));
              },
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
      ),
    );
  }
}
