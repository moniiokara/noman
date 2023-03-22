import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:maximagri/TestFolder/PlaceOrder/dispatchInfo_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/orderItem_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/orderuid_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/payment_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/stop_model.dart';
import 'package:maximagri/TestFolder/PlaceOrder/place_order_model.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({Key? key}) : super(key: key);

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // userplaceOrder() async {
  //   final placeOrder = PlaceOrderModel(
  //     customerName: "customerNameTwo",
  //     orderNum: 10,
  //     dateTime: DateTime.now(),
  //     stops: [
  //       Stop(stopName: "stopName", shopName: "shopName", orderItem: [
  //         OrderItem(
  //             productName: "productName",
  //             productPrice: 200,
  //             productTotal: 100,
  //             productQuantity: 400),
  //       ]),
  //     ],
  //     orderTotal: 80,
  //     orderQuantity: 60,
  //     orderUid: OrderUid(
  //         asmUid: "zsmUid",
  //         dealerUid: "dealerUid",
  //         asoUid: "asoUid",
  //         zsmUid: "zsmUid"),
  //     payment: Payment(
  //         bankName: "Bank",
  //         amount: 300,
  //         image: 'payment-image',
  //         creditLimit: 100),
  //     dispatchInfo:
  //         DispatchInfo(driverNo: 205, vehicalNo: 123466, time: DateTime.now()),
  //   );
  //
  //   await _firestore
  //       .collection("Order Placement")
  //       .doc()
  //       .set(placeOrder.toJson())
  //       .then((value) => print("Successfully Order Place"));
  // }

  final placeOrder = PlaceOrderModel(
    customerName: "customerNameTwo",
    orderNum: 10,
    dateTime: DateTime.now(),
    stops: [
      Stop(stopName: "stopName", shopName: "shopName", orderItem: [
        OrderItem(
            productName: "productName",
            productPrice: 200,
            productTotal: 100,
            productQuantity: 400),
      ]),
    ],
    orderTotal: 80,
    orderQuantity: 60,
    orderUid: OrderUid(
        asmUid: "zsmUid",
        dealerUid: "dealerUid",
        asoUid: "asoUid",
        zsmUid: "zsmUid"),
    payment: Payment(
        bankName: "Bank",
        amount: 300,
        image: 'payment-image',
        creditLimit: 100),
    dispatchInfo:
    DispatchInfo(driverNo: 205, vehicalNo: 123466, time: DateTime.now()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Place Order"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Customer Name: ${placeOrder.customerName}'),
              Text('Order Number: ${placeOrder.orderNum}'),
              Text('Order Total: ${placeOrder.orderTotal}'),
              Text('Order Quantity: ${placeOrder.orderQuantity}'),
              Text('Date and Time: ${placeOrder.dateTime.toString()}'),
              Text('Stops: '),
              ListView.builder(
                shrinkWrap: true,
                itemCount: placeOrder.stops.length,
                itemBuilder: (context, index) {
                  final stop = placeOrder.stops[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Stop Name: ${stop.stopName}'),
                      Text('Shop Name: ${stop.shopName}'),
                      Text('Order Items: '),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: stop.orderItem.length,
                        itemBuilder: (context, index) {
                          final orderItem = stop.orderItem[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Product Name: ${orderItem.productName}'),
                              Text('Product Price: ${orderItem.productPrice}'),
                              Text('Product Quantity: ${orderItem.productQuantity}'),
                              Text('Product Total: ${orderItem.productTotal}'),
                            ],
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
              Text('Order UID: ${placeOrder.orderUid.toString()}'),
              Text('Payment: '),
              Text('Bank Name: ${placeOrder.payment.bankName}'),
              Text('Amount: ${placeOrder.payment.amount}'),
              Text('Credit Limit: ${placeOrder.payment.creditLimit}'),
              Text('Image: ${placeOrder.payment.image}'),
              Text('Dispatch Info: '),
              Text('Driver Number: ${placeOrder.dispatchInfo.driverNo}'),
              Text('Vehicle Number: ${placeOrder.dispatchInfo.vehicalNo}'),
              Text('Time: ${placeOrder.dispatchInfo.time.toString()}'),
            ],
          )

        ));
  }
}
