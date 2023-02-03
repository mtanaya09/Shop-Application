import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';
import '../providers/auth.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            child: AppBar(
              title: Text('Hello, Welcome!'),
              automaticallyImplyLeading: false,
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.local_mall_outlined, size: 30),
            iconColor: Theme.of(context).colorScheme.primary,
            title: Text('Services', style: TextStyle(fontSize: 15)),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment, size: 30),
            iconColor: Theme.of(context).colorScheme.primary,
            title: Text('Orders', style: TextStyle(fontSize: 15)),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(
              //     builder: (ctx) => OrdersScreen(),
              //   ),
              // );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit, size: 30),
            iconColor: Theme.of(context).colorScheme.primary,
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsScreen.routeName);
            },
            title: Text('Manage Products', style: TextStyle(fontSize: 15)),
          ),
          Divider(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 40,
              ),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    size: 30,
                  ),
                  iconColor: Theme.of(context).colorScheme.error,
                  title: Text('Logout', style: TextStyle(fontSize: 15)),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/');
                    // Navigator.of(context)
                    //     .pushReplacementNamed(UserProductsScreen.routeName);
                    Provider.of<Auth>(context, listen: false).logout();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
