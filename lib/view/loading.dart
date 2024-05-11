import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/method/function.dart';
import 'package:myapp/utils.dart';

class GioiThieu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(

      width: double.infinity,
      child: TextButton(
        // loading3UT (1:2)
        onPressed: () {
          Method().navigateToSecondScreen(context);
        },
        style: TextButton.styleFrom (
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(81*fem, 336*fem, 80*fem, 335*fem),
          width: double.infinity,
          height: 960*fem,
          decoration: const BoxDecoration (
            color: Color(0xfffcffeb),
          ),
          child: Column(
            children: [
              Center(
                // premiumvectormodernbubbledrink (15:110)
                child: SizedBox(
                  width: 229*fem,
                  height: 183*fem,
                  child: Image.asset(
                   'assets/page-1/images/GioiThieu.png',
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              const Center(child: Text('Chào mừng bạn đến với \n    cửa hàng chúng tôi', style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500, color: Color(0xff04cf86)),))
            ],
          ),
        ),
      ),
          );
  }
}