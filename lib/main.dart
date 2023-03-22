import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/TestFolder/login_screen.dart';
import 'package:maximagri/TestFolder/PlaceOrder/place_order_page.dart';
import 'package:maximagri/TestFolder/product_page.dart';
import 'package:maximagri/TestFolder/recive_data.dart';
import 'package:maximagri/TestFolder/sent_data.dart';
import 'package:maximagri/firebase_options.dart';
import 'package:maximagri/pages/auth/create_account/create_account_desktop_page.dart';
import 'package:maximagri/pages/dealer/dashboard/dealer_dashboard_mobile_page.dart';
import 'package:maximagri/pages/dealer/order_details/dealer_order_details_mobile_page.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_desktop_page.dart';
import 'package:maximagri/pages/operations/dashboard/operations_dashboard_mobile_page.dart';
import 'package:maximagri/widgets/dispatch_design_widget.dart';
import 'package:maximagri/widgets/drawer/dealer_drawer.dart';
import 'package:maximagri/widgets/final_place_order_screen.dart';
import 'package:maximagri/widgets/payment_design_widget.dart';
import 'package:maximagri/widgets/place_order_screen.dart';
import 'package:maximagri/widgets/place_order_widget.dart';
import 'TestFolder/addressIntilize/address_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaximAgri());
}

class MaximAgri extends StatelessWidget {
  const MaximAgri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      title: 'Maxim Agri',
      debugShowCheckedModeBanner: false,
      //home: DealerDashboardMobilePage(),
     //home: DealerOrderDetailsMobilePage(),
     //  home: FinalPlaceOrderScreen(),

      // home: SendData(),
      // home: DispatchScreen(),
      // home: PlaceOrderPage(),
      //home: PaymentScreen(),

      //   home: PlaceOrderScreen(),
        home: AddItemScreenTwo(),
     //  home: AddItemScreen(),

      //  home: CreateAccountDesktopPage(),
      //  home: SignUpPage(),

      // home: AddressPage(),

      //home: const LoginScreen(),
      //  home: ProductPage(),
      // home: ReciveData(),
    );
  }
}
