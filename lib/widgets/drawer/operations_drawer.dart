import 'package:flutter/material.dart';
import 'package:maximagri/pages/auth/create_account/create_account_desktop_page.dart';

class OperationsDrawer extends StatelessWidget {
  const OperationsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
              accountName: Text("Noman Ashraf"),
              accountEmail: Text("noman@gmail.com"),
              currentAccountPicture: CircleAvatar(
                radius: 45,
              )),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Order Details'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.create),
            title: const Text('Create Account'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const CreateAccountDesktopPage()));
            },
          ),
        ],
      ),
    );
  }
}
