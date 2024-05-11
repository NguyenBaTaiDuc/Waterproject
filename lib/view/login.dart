import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/quenmatkhau.dart';
import 'package:myapp/view/register.dart';

import '../method/function.dart';
import '../model/users.dart';

class DangNhap extends StatefulWidget {
  const DangNhap({super.key});

  @override
  State<DangNhap> createState() => _DangNhapState();
}

class _DangNhapState extends State<DangNhap> {
  final TextEditingController _taikhoan = TextEditingController();
  final TextEditingController _matkhau = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // loginoXV (1:3)
        padding: EdgeInsets.fromLTRB(14*fem, 60*fem, 11*fem, 25*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xfffcffeb),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // premiumvectormodernbubbledrink (68:289)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
              width: 229*fem,
              height: 110*fem,
              child: Image.asset(
                'assets/page-1/images/GioiThieu.png',
              ),
            ),
            Container(
              // ngnhpMxK (8:3)
              margin: EdgeInsets.fromLTRB(8*fem, 0*fem, 0*fem, 47*fem),
              child: Text(
                'Đăng nhập',
                style: SafeGoogleFont (
                  'Inter',
                  fontSize: 36*ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2125*ffem/fem,
                  letterSpacing: 2.52*fem,
                  color: const Color(0xffa0fcdb),
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Container(
              // groupaccounto3d (12:60)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 20 * fem),
              padding: EdgeInsets.fromLTRB(22 * fem, 0 * fem, 22 * fem, 5 * fem),
              width: 362 * fem,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff02b273)),
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(120 * fem),
              ),
              child: Material(
                // Thêm Material widget bao bọc TextFormField
                color: const Color(0xffffffff),
                child: TextFormField(
                  controller: _taikhoan,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.12 * fem,
                      color: const Color(0xff02b273).withOpacity(0.5),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            Container(
              // groupaccounto3d (12:60)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 20 * fem),
              padding: EdgeInsets.fromLTRB(22 * fem, 4 * fem, 22 * fem, 0 * fem),
              width: 362 * fem,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff02b273)),
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(120 * fem),
              ),
              child: Material(
                // Thêm Material widget bao bọc TextFormField
                color: const Color(0xffffffff),
                child: TextFormField(
                  controller: _matkhau,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Mật khẩu',
                    hintStyle: TextStyle(
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.12 * fem,
                      color: const Color(0xff02b273).withOpacity(0.5),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          QuenMatKhau()),
                );
              },
              child: Container(
                // qunmtkhusr7 (8:13)
                margin: EdgeInsets.fromLTRB(225*fem, 0*fem, 0*fem, 14*fem),
                child: Text(
                  'Quên mật khẩu?',
                  style: SafeGoogleFont (
                    'Inter',
                    fontSize: 16*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125*ffem/fem,
                    letterSpacing: 1.12*fem,
                    color: const Color(0xff02b273),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              // groupregister79y (12:99)
              margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 40 * fem),
              child: GestureDetector(
                onTap: () async {
                 Users dangnhap = Users.loginWithEmailPassword(_taikhoan.text, _matkhau.text);
                  // Gọi hàm signInWithEmailAndPassword
                  await Method().signInWithEmailAndPassword(dangnhap, context);
                },
                child: Container(
                  width: double.infinity,
                  height: 40 * fem,
                  decoration: BoxDecoration(
                    color: const Color(0xff04cf86),
                    borderRadius: BorderRadius.circular(20 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Đăng nhập',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        letterSpacing: 1.4 * fem,
                        color: const Color(0xffffffff),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // grouploginwith9h9 (12:58)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 29*fem),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // line1H2f (12:16)
                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 7*fem, 0*fem),
                    width: 104*fem,
                    height: 1*fem,
                    decoration: const BoxDecoration (
                      color: Color(0xff02b273),
                    ),
                  ),
                  Container(
                    // ngnhpbngoWo (12:18)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                    child: Text(
                      'Đăng nhập bằng',
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125*ffem/fem,
                        letterSpacing: 1.12*fem,
                        color: const Color(0xff02b273),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  Container(
                    // line2hMH (12:17)
                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                    width: 106*fem,
                    height: 1*fem,
                    decoration: const BoxDecoration (
                      color: Color(0xff02b273),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroup45bmcUF (KPQWcGAzxxhw1WX9sQ45bm)
              margin: EdgeInsets.fromLTRB(22*fem, 0*fem, 25*fem, 143*fem),
              width: double.infinity,
              height: 40*fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()async{
                      await Method().signInWithGoogle(context);
                    },
                    child: Container(
                      // groupgooglevjq (12:35)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 43*fem, 0*fem),
                      padding: EdgeInsets.fromLTRB(22*fem, 5*fem, 20*fem, 6*fem),
                      height: double.infinity,
                      decoration: BoxDecoration (
                        border: Border.all(color: const Color(0xff02b273)),
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20*fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // google1Qf1 (12:30)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                            width: 29*fem,
                            height: 29*fem,
                            child: Image.asset(
                              'assets/page-1/images/google-1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            // googleB3V (12:31)
                            margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                            child: Text(
                              'Google',
                              style: SafeGoogleFont (
                                'Inter',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125*ffem/fem,
                                letterSpacing: 1.12*fem,
                                color: const Color(0xff02b273),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    // groupfacebookHcK (12:36)
                    padding: EdgeInsets.fromLTRB(11*fem, 5*fem, 9*fem, 6*fem),
                    height: double.infinity,
                    decoration: BoxDecoration (
                      border: Border.all(color: const Color(0xff02b273)),
                      color: const Color(0xffffffff),
                      borderRadius: BorderRadius.circular(20*fem),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // facebook1o4s (12:40)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                          width: 29*fem,
                          height: 29*fem,
                          child: Image.asset(
                            'assets/page-1/images/facebook-1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          // facebookKou (12:38)
                          margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                          child: Text(
                            'Facebook',
                            style: SafeGoogleFont (
                              'Inter',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125*ffem/fem,
                              letterSpacing: 1.12*fem,
                              color: const Color(0xff02b273),
                              decoration: TextDecoration.none,
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
              // Khung chứa nút Đăng ký
              margin: EdgeInsets.fromLTRB(42 * fem, 0 * fem, 45 * fem, 0 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // Text "Bạn chưa có tài khoản?"
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 0 * fem),
                    child: Text(
                      'Bạn chưa có tài khoản?',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125 * ffem / fem,
                        letterSpacing: 1.12 * fem,
                        color: const Color(0x7f02b273),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    // Sử dụng GestureDetector thay cho TextButton
                    onTap: () {
                      Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const DangKy()));
                      // Xử lý sự kiện khi chọn "Đăng ký"

                    },
                    child: Text(
                      'Đăng ký',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2125 * ffem / fem,
                        letterSpacing: 1.12 * fem,
                        color: const Color(0xff96d907),
                        decoration: TextDecoration.none, // Thêm gạch dưới chữ "Đăng ký"
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