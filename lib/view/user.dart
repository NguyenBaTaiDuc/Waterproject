import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/danhsachdonhangKH.dart';
import 'package:myapp/view/favourite.dart';
import 'package:myapp/view/login.dart';
import 'package:myapp/view/thongtincanhankhachhang.dart';
import 'package:myapp/view/thongtinphanmem.dart';
class ThongTinCaNhan extends StatefulWidget {
  const ThongTinCaNhan({super.key});

  @override
  State<ThongTinCaNhan> createState() => ThongTinCaNhanState();
}

class ThongTinCaNhanState extends State<ThongTinCaNhan> {
  @override
  void initState() {
    // TODO: implement initState
      super.initState();
      _getUid();
  }
  late final String _uid;
  Future<void> _getUid() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        _uid  = user.uid;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Container(
          // userJH5 (2:10)
          width: double.infinity,
          decoration: const BoxDecoration (
            color: Color(0xfffcffeb),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // groupheaderDew (26:126)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 39*fem),
                padding: EdgeInsets.fromLTRB(24.86*fem, 21*fem, 26.03*fem, 10*fem),
                width: double.infinity,
                decoration: BoxDecoration (
                  color: const Color(0xffffffff),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x3f02b273),
                      offset: Offset(0*fem, 4*fem),
                      blurRadius: 2*fem,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // autogrouply6kynX (KPQrd6zQvQzwBPtm9iLY6K)
                      margin: EdgeInsets.fromLTRB(0.14*fem, 0*fem, 1.97*fem, 0*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // ellipse10Vks (26:174)
                            margin: EdgeInsets.fromLTRB(0*fem, 30*fem, 17*fem, 0*fem),
                            width: 77*fem,
                            height: 77*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(38.5*fem),
                              border: Border.all(color: const Color(0xff288463)),
                              image: const DecorationImage (
                                fit: BoxFit.cover,
                                image: AssetImage (
                                  'assets/page-1/images/ellipse-10-bg.png',
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x3f02b273),
                                  offset: Offset(0*fem, 4*fem),
                                  blurRadius: 2*fem,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20,top: 30),
                            child: Text(
                              // khchhngkgo (26:175)
                              'Khách hàng',
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 25*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.2125*ffem/fem,
                                color: const Color(0xff04cf86),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 60, top: 29),
                            width: 21.33*fem,
                            height: 26.67*fem,
                            child: Image.asset(
                              'assets/page-1/images/notifications.png',
                              width: 21.33*fem,
                              height: 26.67*fem,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                // autogroupxrcjt2K (KPQqCECqZprhpcLdbKXRCj)
                margin: EdgeInsets.fromLTRB(35*fem, 10*fem, 21*fem, 10*fem),
                width: double.infinity,
                height: 100*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      // grouporderPjm (74:280)
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DanhSachDonHangKH()),
                        );
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 75*fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupy2cx7Qs (KPQqWig2ZhSFYGC4Y7Y2CX)
                              margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 4.29*fem, 5*fem),
                              padding: EdgeInsets.fromLTRB(7*fem, 6*fem, 6.71*fem, 6*fem),
                              width: double.infinity,
                              decoration: BoxDecoration (
                                color: const Color(0xff02b273),
                                borderRadius: BorderRadius.circular(10*fem),
                              ),
                              child: Center(
                                // vectorooV (51:275)
                                child: SizedBox(
                                  width: 52*fem,
                                  height: 48*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector-bKm.png',
                                    width: 52*fem,
                                    height: 48*fem,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // nhngKmq (76:122)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                              child: Text(
                                'Đơn hàng',
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
                                  color: const Color(0xff04cf86),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 49*fem,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Điều khiển khi người dùng nhấn vào nút Yêu thích
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const YeuThich()),
                        );
                      },
                      child: Container(
                        width: 72 * fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // autogroupwjgxwHR (KPQqPUP6smurvLxBDmwJGX)
                              margin: EdgeInsets.fromLTRB(3 * fem, 0 * fem, 3.29 * fem, 5 * fem),
                              padding: EdgeInsets.fromLTRB(7 * fem, 6 * fem, 7.71 * fem, 6 * fem),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff02b273),
                                borderRadius: BorderRadius.circular(10 * fem),
                              ),
                              child: Center(
                                // vectorEGX (51:277)
                                child: SizedBox(
                                  width: 51 * fem,
                                  height: 48 * fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector.png',
                                    width: 51 * fem,
                                    height: 48 * fem,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // yuthchxTR (76:125)
                              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 0 * fem),
                              child: Text(
                                'Yêu thích',
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xff04cf86),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 49*fem,
                    ),
                    TextButton(
                      // groupuserinforSdV (74:278)
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  ThongTinNguoiDung(uid: _uid,)),
                        );
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          width: 89*fem,
                          height: 160,
                          child: Column(
                            children: [
                              Container(
                                // autogrouppw4bZTD (KPQqf3mUwaxWsYigrXPw4b)
                                margin: EdgeInsets.fromLTRB(11*fem, 0*fem, 12.29*fem, 5*fem),
                                padding: EdgeInsets.fromLTRB(8*fem, 6*fem, 7.71*fem, 6*fem),
                                width: double.infinity,
                                decoration: BoxDecoration (
                                  color: const Color(0xff02b273),
                                  borderRadius: BorderRadius.circular(10*fem),
                                ),
                                child: Center(
                                  // vectorfFM (76:129)
                                  child: SizedBox(
                                    width: 50*fem,
                                    height: 48*fem,
                                    child: Image.asset(
                                      'assets/page-1/images/vector-KEw.png',
                                      width: 50*fem,
                                      height: 48*fem,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                // ngidngnqm (76:127)
                                'Người dùng\n\n\n',
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.2125*ffem/fem,
                                  color: const Color(0xff04cf86),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             Container(
                 child: Column(
                 children: [
                   Container(
                     height: 50,
                     // group1192KKu (76:108)
                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21*fem),
                     padding: EdgeInsets.fromLTRB(20.13*fem, 0*fem, 266.66*fem, 0*fem),
                     width: double.infinity,
                     decoration: BoxDecoration (
                       border: Border.all(color: const Color(0xff04cf86)),
                       color: const Color(0xffffffff),
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                           // iconoircoinsnjH (76:115)
                           margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2.46*fem, 0.64*fem),
                           width: 18.75*fem,
                           height: 18.75*fem,
                           child: Image.asset(
                             'assets/page-1/images/iconoir-coins.png',
                             width: 18.75*fem,
                             height: 18.75*fem,
                           ),
                         ),
                         Container(
                           // xutchlyhLT (76:114)
                           margin: EdgeInsets.fromLTRB(2*fem, 15*fem, 0*fem, 0*fem),
                           child: Text(
                             'Xu tích lũy\n\n',
                             style: SafeGoogleFont (
                               'Inter',
                               fontSize: 16*ffem,
                               fontWeight: FontWeight.w400,
                               height: 1.2125*ffem/fem,
                               color: const Color(0xff288463),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     // group1191Co1 (76:96)
                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21.29*fem),
                     padding: EdgeInsets.fromLTRB(16*fem, 6*fem, 253.75*fem, 6*fem),
                     width: double.infinity,
                     height: 44.71*fem,
                     decoration: BoxDecoration (
                       border: Border.all(color: const Color(0xff04cf86)),
                       color: const Color(0xffffffff),
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                           // groupWYo (76:104)
                           margin: EdgeInsets.fromLTRB(0*fem, 5*fem,   3.25*fem, 7.71*fem),
                           width: 25*fem,
                           height: 25*fem,
                           child: Image.asset(
                             'assets/page-1/images/group.png',
                             width: 25*fem,
                             height: 25*fem,
                           ),
                         ),
                         Container(
                           // vvoucherRvf (76:102)
                           margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 2.96*fem),
                           child: Text(
                             'Ví Voucher\n',
                             style: SafeGoogleFont (
                               'Inter',
                               fontSize: 16*ffem,
                               fontWeight: FontWeight.w400,
                               height: 1.2125*ffem/fem,
                               color: const Color(0xff288463),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     // group1190YEb (76:95)
                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 24*fem),
                     padding: EdgeInsets.fromLTRB(14.87*fem, 15.51*fem, 244.66*fem, 0*fem),
                     width: double.infinity,
                     decoration: BoxDecoration (
                       border: Border.all(color: const Color(0xff04cf86)),
                       color: const Color(0xffffffff),
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                           // solarletterbrokenDbd (76:91)
                           margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.78*fem, 17*fem),
                           width: 25*fem,
                           height:25*fem,
                           child: Image.asset(
                             'assets/page-1/images/solar-letter-broken.png',
                             width: 21.69*fem,
                             height: 18.47*fem,
                           ),
                         ),
                         Text(
                           // mibnbiHV (76:90)
                           'Mời bạn bè\n',
                           style: SafeGoogleFont (
                             'Inter',
                             fontSize: 16*ffem,
                             fontWeight: FontWeight.w400,
                             height: 1.2125*ffem/fem,
                             color: const Color(0xff288463),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     // grcsqdEmd (76:120)
                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                     padding: EdgeInsets.fromLTRB(15*fem, 6*fem, 186*fem, 6*fem),
                     width: double.infinity,
                     decoration: BoxDecoration (
                       border: Border.all(color: const Color(0xff04cf86)),
                       color: const Color(0xffffffff),
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                           // vectoriwh (51:269)
                           margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 9*fem, 0*fem),
                           width: 25*fem,
                           height: 25*fem,
                           child: Image.asset(
                             'assets/page-1/images/vector-obm.png',
                             width: 25*fem,
                             height: 25*fem,
                           ),
                         ),
                         Container(
                           // chnhschquynh3j5 (51:270)
                           margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 0*fem),
                           child: Text(
                             'Chính sách quy định',
                             style: SafeGoogleFont (
                               'Inter',
                               fontSize: 16*ffem,
                               fontWeight: FontWeight.w400,
                               height: 1.2125*ffem/fem,
                               color: const Color(0xff288463),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     // group1199xb9 (74:26)
                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17*fem),
                     padding: EdgeInsets.fromLTRB(16.58*fem, 8.08*fem, 281*fem, 8*fem),
                     width: double.infinity,
                     decoration: BoxDecoration (
                       border: Border.all(color: const Color(0xff04cf86)),
                       color: const Color(0xffffffff),
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                           // settingsoutlineroundedfEf (51:266)
                           margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 17.58*fem, 0.08*fem),
                           width: 19.83*fem,
                           height: 20.83*fem,
                           child: Image.asset(
                             'assets/page-1/images/settings-outline-rounded.png',
                             width: 19.83*fem,
                             height: 20.83*fem,
                           ),
                         ),
                         Container(
                           // cita6j (30:195)
                           margin: EdgeInsets.fromLTRB(0*fem, 0.92*fem, 0*fem, 0*fem),
                           child: Text(
                             'Cài đặt',
                             style: SafeGoogleFont (
                               'Inter',
                               fontSize: 16*ffem,
                               fontWeight: FontWeight.w400,
                               height: 1.2125*ffem/fem,
                               color: const Color(0xff288463),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                   Container(
                     // autogroupwukrUC7 (KPQqko6uXFQcp2whZ4wUKR)
                     margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 21*fem),
                     padding: EdgeInsets.fromLTRB(17.67*fem, 6*fem, 150*fem, 6*fem),
                     width: double.infinity,
                     decoration: BoxDecoration (
                       border: Border.all(color: const Color(0xff04cf86)),
                       color: const Color(0xffffffff),
                     ),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Container(
                           // waterfullroundedmBD (30:197)
                           margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13.67*fem, 0*fem),
                           width: 21.67*fem,
                           height: 25*fem,
                           child: Image.asset(
                             'assets/page-1/images/water-full-rounded.png',
                             width: 21.67*fem,
                             height: 25*fem,
                           ),
                         ),
                         GestureDetector(
                           onTap: (){
                             Navigator.of(context).push(
                               MaterialPageRoute(
                                   builder: (context) =>
                                    ThongTinPhanMem()),
                             );
                           },
                           child: Container(
                             // vbubbleteaT43 (30:196)
                             margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                             child: Text(
                               'Thông tin ứng dụng',
                               style: SafeGoogleFont (
                                 'Inter',
                                 fontSize: 16*ffem,
                                 fontWeight: FontWeight.w400,
                                 height: 1.2125*ffem/fem,
                                 color: const Color(0xff288463),
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
              Container(
                // groupbtnlogout9xT (26:178)
                margin: EdgeInsets.fromLTRB(79*fem, 20*fem, 80*fem, 8*fem),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                          const DangNhap()),
                    );
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 44*fem,
                    decoration: BoxDecoration (
                      color: const Color(0xff04cf86),
                      borderRadius: BorderRadius.circular(25*fem),
                    ),
                    child: Center(
                      child: Text(
                        'Đăng xuất',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 20*ffem,
                          fontWeight: FontWeight.w400,
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
      ),
    );
  }
}
