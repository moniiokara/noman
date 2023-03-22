import 'package:flutter/material.dart';
import 'package:maximagri/widgets/home_card_widget.dart';

class DealerDashboardMobilePage extends StatelessWidget {
  static const String routeName = 'dealerDashboardMobilePage';
  const DealerDashboardMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
       
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeCardWidget(
                   iconData: Icons.place,
                    onTap: (){},
                    title: 'Place Order',
                    subtitle: 'To order something to', ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeCardWidget(
                    iconData: Icons.details,
                    onTap: (){},
                    title: 'Order Details',
                    subtitle: 'To order something to',),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeCardWidget(
                    iconData: Icons.contacts,
                    onTap: (){},
                    title: 'Contact Us',
                    subtitle: 'To order something to', ),
                  const SizedBox(
                    height: 20,
                  ),
                  HomeCardWidget(
                    iconData: Icons.details,
                    onTap: (){},
                    title: 'About Us',
                    subtitle: 'To order something to',),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
