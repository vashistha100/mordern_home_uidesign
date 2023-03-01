import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mordern_home_uidesign2/util/grid_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //constant padding
  final double horizontalpadding = 40;
  final double verticalpadding = 25;

  //List of smart devices

  List mySmartDevces = [
    //[smartdevicename , path , onoffstatus]
    ["Smart Light", "assets/icons/light-bulb.png", true],
    ["Smart Ac", "assets/icons/air-conditioner.png", false],
    ["Smart Tv", "assets/icons/smart-tv.png", false],
    ["Smart Fan", "assets/icons/fan.png", false],
  ];
  // function to switch on and off
  void onchanged(value, index) {
    setState(() {
      mySmartDevces[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalpadding, vertical: verticalpadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/icons/menu.png',
                  height: 45,
                  color: Colors.grey[800],
                ),
                Icon(Icons.person, size: 45, color: Colors.grey[800]),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Home,",
                  style: TextStyle(fontSize: 20, color: Colors.grey[800]), 
                ),
                Text(
                  "MANISH",
                  style: GoogleFonts.bebasNeue(fontSize: 72),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: const Divider(
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalpadding),
            child: const Text(
              "Smart Devices",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.all(20),

                  padding: const EdgeInsets.all(28),
                  itemCount: mySmartDevces.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MySmartDevice(
                        smartDeviceName: mySmartDevces[index][0],
                        iconPath: mySmartDevces[index][1],
                        powerOn: mySmartDevces[index][2],
                        onchanged: (value) {
                          onchanged(value, index);
                        },
                      ),
                    );
                  }))
        ],
      )),
    );
  }
}
