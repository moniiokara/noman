import 'package:flutter/material.dart';
import 'package:maximagri/widgets/order_card_widget.dart';

class DealerOrderDetailsMobilePage extends StatelessWidget {
  static const String routeName = 'dealerOrderDetailsMobilePage';
  const DealerOrderDetailsMobilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: const [
          OrderCardWidget(
            name: 'Noman Ashraf',
            orderNo: '123456',
            dateTime: '2023-03-20  10:00 AM',
            totalQuantity: '2',
            totalPrice: '50 USD',
            status: 'Pending',
          ),
         // SizedBox(height: 10,),
          OrderCardWidget(
            name: 'Adnan Ashraf',
            orderNo: '123456',
            dateTime: '2023-03-20 10:00 AM',
            totalQuantity: '2',
            totalPrice: '50 USD',
            status: 'Pending',
          ),

        ],
      ),
    );
  }
}
