import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // feedbackmy9 (79:776)
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xfffcffeb),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // groupheaderJiB (74:376)
              padding: EdgeInsets.fromLTRB(24.86*fem, 30.6*fem, 15*fem, 57*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                color: const Color(0xff04cf86),
                borderRadius: BorderRadius.only (
                  bottomRight: Radius.circular(70*fem),
                  bottomLeft: Radius.circular(70*fem),
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x3f02b273),
                    offset: Offset(0*fem, 4*fem),
                    blurRadius: 2*fem,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    // ioselementsypK (74:378)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11.03*fem, 21.71*fem),
                    width: 339.11*fem,
                    height: 11.69*fem,
                    child: Image.asset(
                      'assets/page-1/images/ios-elements-GBR.png',
                      width: 339.11*fem,
                      height: 11.69*fem,
                    ),
                  ),
                  Container(
                    // hometRV (74:445)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 47*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 30*fem,
                        height: 30*fem,
                        child: Image.asset(
                          'assets/page-1/images/home-aaj.png',
                          width: 30*fem,
                          height: 30*fem,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // nhgisnphmNrT (74:418)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 61*fem, 0*fem),
                    child: Text(
                      'Đánh giá sản phẩm',
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroup2suu4UP (KPQkvw9E3QGwEroTgr2Suu)
              padding: EdgeInsets.fromLTRB(15*fem, 26*fem, 15*fem, 22*fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // thanhpham11201kc7 (79:904)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 26*fem),
                    width: 120*fem,
                    height: 120*fem,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only (
                        topLeft: Radius.circular(20*fem),
                        bottomRight: Radius.circular(20*fem),
                      ),
                      child: Image.asset(
                        'assets/page-1/images/thanh-pham-1120-1-oNo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    // satitrnchungenCU7 (79:908)
                    margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 6*fem),
                    child: Text(
                      'Sữa tươi trân châu đường đen',
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125*ffem/fem,
                        color: const Color(0xff288463),
                      ),
                    ),
                  ),
                  Container(
                    // groupstarsfcb (74:422)
                    margin: EdgeInsets.fromLTRB(104*fem, 0*fem, 103.66*fem, 40.66*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // vectorajZ (79:948)
                          width: 28.34*fem,
                          height: 26.34*fem,
                          child: Image.asset(
                            'assets/page-1/images/vector-Wsy.png',
                            width: 28.34*fem,
                            height: 26.34*fem,
                          ),
                        ),
                        SizedBox(
                          width: 2.66*fem,
                        ),
                        Container(
                          // vectortkF (79:944)
                          width: 28.34*fem,
                          height: 26.34*fem,
                          child: Image.asset(
                            'assets/page-1/images/vector-8CF.png',
                            width: 28.34*fem,
                            height: 26.34*fem,
                          ),
                        ),
                        SizedBox(
                          width: 2.66*fem,
                        ),
                        Container(
                          // vectorp87 (79:945)
                          width: 28.34*fem,
                          height: 26.34*fem,
                          child: Image.asset(
                            'assets/page-1/images/vector-K6X.png',
                            width: 28.34*fem,
                            height: 26.34*fem,
                          ),
                        ),
                        SizedBox(
                          width: 2.66*fem,
                        ),
                        Container(
                          // vector8Ph (79:947)
                          width: 28.34*fem,
                          height: 26.34*fem,
                          child: Image.asset(
                            'assets/page-1/images/vector-fwM.png',
                            width: 28.34*fem,
                            height: 26.34*fem,
                          ),
                        ),
                        SizedBox(
                          width: 2.66*fem,
                        ),
                        Container(
                          // vector3mZ (79:946)
                          width: 28.34*fem,
                          height: 26.34*fem,
                          child: Image.asset(
                            'assets/page-1/images/vector-36F.png',
                            width: 28.34*fem,
                            height: 26.34*fem,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // groupinputfbzB1 (74:427)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 127*fem),
                    width: double.infinity,
                    height: 132*fem,
                    decoration: const BoxDecoration (
                      image: DecorationImage (
                        fit: BoxFit.cover,
                        image: AssetImage (
                          'assets/page-1/images/rectangle-32.png',
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Nêu cảm nhận tại đây nhé!',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xff04cf86),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    // grouppayFcj (74:423)
                    margin: EdgeInsets.fromLTRB(29*fem, 0*fem, 30*fem, 0*fem),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 70*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xff04cf86),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: Center(
                          child: Text(
                            'Đánh giá',
                            style: SafeGoogleFont (
                              'Inter',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
          );
  }
}