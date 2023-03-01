import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySmartDevice extends StatelessWidget {
  final String smartDeviceName;
  final String iconPath;
  final bool powerOn;
  void Function(bool)? onchanged;
  MySmartDevice({
    super.key,
    required this.smartDeviceName,
    required this.iconPath,
    required this.powerOn,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     color: Colors.grey[200],
    //     borderRadius: BorderRadius.circular(24),
    //   ),
    //   padding: const EdgeInsets.symmetric(vertical: 25),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Image.asset(
    //         iconPath,
    //         height: 65,
    //       ),
    //       Row(
    //         children: [
    //           Expanded(
    //             child: Padding(
    //               padding: const EdgeInsets.only(left: 25),
    //               child: Expanded(
    //                 child: Text(
    //                   smartDeviceName,
    //                   style: const TextStyle(
    //                       fontSize: 20, fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ),
    //           ),
    //           CupertinoSwitch(
    //             value: false,
    //             onChanged: (value) {},
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // );
    return Container(
      decoration: BoxDecoration(
        color:powerOn? Colors.grey[900]: Colors.grey[200],
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            iconPath,
            height: 65,
            color: powerOn? Colors.white : Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      smartDeviceName,
                      style:  TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,
                          color: powerOn? Colors.white: Colors.black),
                          
                    ),
                  ),
                ),
                Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: powerOn,
                      onChanged: onchanged,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
