import 'package:flutter/material.dart';

class HomeCardWidget extends StatelessWidget {
  //const HomeCardWidget({Key? key}) : super(key: key);

  HomeCardWidget(
      {required this.onTap,
      required this.title,
      required,
      required this.subtitle,
      required this.iconData});

  Function onTap;
  final String title;
  final String subtitle;

  // circle avator

  final IconData iconData;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 0,
        //  shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.26,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    colors: [Colors.lightGreenAccent, Colors.grey],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 26,
                      child: Icon(
                        iconData,
                        size: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      title,
                      // "Place Order",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        subtitle,
                        // "To order something to",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ),
                     CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 18,
                      child: Icon(
                          Icons.navigate_next,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
