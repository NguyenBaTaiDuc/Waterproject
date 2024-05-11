import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/users.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/homepage.dart';

class ThongTinNguoiDung extends StatefulWidget {
  String uid;
  ThongTinNguoiDung({super.key, required this.uid});

  @override
  State<ThongTinNguoiDung> createState() => _ThongTinNguoiDungState();
}

class _ThongTinNguoiDungState extends State<ThongTinNguoiDung> {
  late final Users userData; // Đổi từ userSnapshot sang userData kiểu Users

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot userDataSnapshot =
      await firestore.collection('Users').doc(widget.uid).get();

      if (userDataSnapshot.exists) {
        setState(() {
          userData = Users.fromFirestore(userDataSnapshot); // Truyền trực tiếp DocumentSnapshot vào hàm fromFirestore
        });
      } else {
        // Handle case when user data doesn't exist
        print('User data not found');
      }
    } catch (error) {
      // Handle error
      print('Error fetching user data: $error');
    }
  }


  @override
  void initState() {
    super.initState();
    fetchUserData();
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: 412,
      child: Container(
        // userinfori3H (2:11)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 50*fem),
        width: double.infinity,
        height: 500,
        decoration: const BoxDecoration (
          color: Color(0xfffcffeb),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // groupheadernoq (74:231)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 47*fem),
              padding: EdgeInsets.fromLTRB(1*fem, 26*fem, 1*fem, 57*fem),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroup95afVrf (KPQkZn5oxr1YXzhbCe95AF)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 30*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // arrowbackroundedDnf (74:434)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 259*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(top: 25),
                              width: 35*fem,
                              height: 35*fem,
                              child: Image.asset(
                                'assets/page-1/images/arrow-back-rounded-VL3.png',
                                width: 35*fem,
                                height: 35*fem,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          // homehC3 (74:432)
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TrangChuKhachHang()),
                            );
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(top: 30),
                            width: 30*fem,
                            height: 30*fem,
                            child: Image.asset(
                              'assets/page-1/images/home.png',
                              width: 30*fem,
                              height: 30*fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // thngtinkhchhng2EK (74:274)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                    child: Text(
                      'Thông tin khách hàng',
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125*ffem/fem,
                        color: const Color(0xffffffff),
                        decoration: TextDecoration.none
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group1193WQP (76:179)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 13*fem),
              padding: EdgeInsets.fromLTRB(31*fem, 20*fem, 31*fem, 9*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: const Color(0xff04cf86)),
                color: const Color(0xffffffff),
              ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Họ và tên :             ${userData.displayName}',
                  textAlign: TextAlign.start,
                  style: SafeGoogleFont (
                    'Inter',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125*ffem/fem,
                    color: const Color(0xff288463),
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            Container(
              // group1194m5R (76:196)
              margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 13*fem),
              padding: EdgeInsets.fromLTRB(31*fem, 20*fem, 31*fem, 9*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: const Color(0xff04cf86)),
                color: const Color(0xffffffff),
              ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Giới tính :               ${userData.gioitinh}',
                  style: SafeGoogleFont (
                    'Inter',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125*ffem/fem,
                    color: const Color(0xff288463),
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            Container(
              // group11981VZ (76:217)
              margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 13*fem),
              padding: EdgeInsets.fromLTRB(31*fem, 20*fem, 31*fem, 11*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: const Color(0xff04cf86)),
                color: const Color(0xffffffff),
              ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Ngày sinh :            ${userData.ngaysinh}',
                  style: SafeGoogleFont (
                    'Inter',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125*ffem/fem,
                    color: const Color(0xff288463),
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            Container(
              // group1193snf (76:202)
              margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 13*fem),
              padding: EdgeInsets.fromLTRB(31*fem, 20*fem, 31*fem, 11.61*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: const Color(0xff04cf86)),
                color: const Color(0xffffffff),
              ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Số điện thoại :       ${userData.sdt}',
                  style: SafeGoogleFont (
                    'Inter',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125*ffem/fem,
                    color: const Color(0xff288463),
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            Container(
              // group1197AvB (76:213)
              margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 13*fem),
              padding: EdgeInsets.fromLTRB(31*fem, 20*fem, 31*fem, 9*fem),
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: const Color(0xff04cf86)),
                color: const Color(0xffffffff),
              ),
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Email :                     ${userData.email}',
                  style: SafeGoogleFont (
                    'Inter',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125*ffem/fem,
                    color: const Color(0xff288463),
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            // Container(
            //   // groupbtnlogoutuWP (74:204)
            //   margin: EdgeInsets.fromLTRB(74*fem, 0*fem, 85*fem, 0*fem),
            //   width: double.infinity,
            //   height: 44*fem,
            //   decoration: BoxDecoration (
            //     color: Color(0xff04cf86),
            //     borderRadius: BorderRadius.circular(25*fem),
            //   ),
            //   child: Center(
            //     child: Text(
            //       'Cập nhật',
            //       style: SafeGoogleFont (
            //         'Inter',
            //         fontSize: 20*ffem,
            //         fontWeight: FontWeight.w400,
            //         height: 1.2125*ffem/fem,
            //         color: Color(0xffffffff),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
