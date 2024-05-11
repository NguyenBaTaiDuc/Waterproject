import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/method/function.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/login.dart';
import '../method/firebase_auth.dart';
import '../model/users.dart';

class DangKy extends StatefulWidget {
  const DangKy({super.key});

  @override
  State<DangKy> createState() => _DangKyState();
}

class _DangKyState extends State<DangKy> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  //mặc định chọn ngày sinh là hôm nay
  DateTime selectedDate = DateTime.now();
  // biến check xử dụng cho checkbox
  bool isChecked = false;
  final TextEditingController _hoTenController = TextEditingController();
  final TextEditingController _soDienThoaiController = TextEditingController();
  final TextEditingController _ngaySinhController = TextEditingController();
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _matKhauController = TextEditingController();
  final TextEditingController _gioitinhController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // register27H (1:4)
        padding: EdgeInsets.fromLTRB(14*fem, 60*fem, 14*fem, 0*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xfffcffeb),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // premiumvectormodernbubbledrink (68:296)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
              width: 229*fem,
              height: 0*fem,
              child: Image.asset(
                'assets/page-1/images/GioiThieu.png',
              ),
            ),
            Container(
              // ngkp39 (68:290)
              margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 48*fem),
              child: Text(
                'Đăng ký',
                style: SafeGoogleFont (
                  'Inter',
                  fontSize: 36*ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.2125*ffem/fem,
                  letterSpacing: 2.52*fem,
                  color: const Color(0xffa0fcdb),
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
                  controller: _hoTenController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Họ tên',
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
                  controller: _gmailController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Gmail',
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
                  controller: _soDienThoaiController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Số điện thoại',
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
              child: Row(
                children: [
                  Expanded(
                    child: Material( // Wrap InkWell with Material
                      child: InkWell(
                        onTap: () {
                          DatePicker.showDatePicker(
                            context,
                            showTitleActions: true,
                            minTime: DateTime(1900),
                            maxTime: DateTime.now(),
                            onConfirm: (date) {
                              setState(() {
                                selectedDate = date;
                                _ngaySinhController.text =
                                "${date.day}/${date.month}/${date.year}";
                              });
                            },
                            currentTime: DateTime.now(),
                          );
                        },
                        child: TextFormField(
                          controller: _ngaySinhController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Ngày sinh',
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
                  ),
                  Material( // Wrap Icon with Material
                    child: InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            // Format the picked date
                            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                            _ngaySinhController.text = formattedDate;

                          });
                        }
                      },
                      child: const Icon(
                        Icons.calendar_today,
                        color: Color(0xff02b273),
                      ),
                    ),
                  ),
                ],
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
                  controller: _matKhauController,
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
                  controller: _gioitinhController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Giới tính',
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
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nhập lại Mật khẩu',
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
              // autogroupcppvkWT (KPQXQf1N2ZPAVU3P5UCPPV)
              margin: EdgeInsets.fromLTRB(12 * fem, 0 * fem, 40.5 * fem, 4 * fem),
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    type: MaterialType.transparency, // Loại Material
                    child: Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    // tingvicciukhonsdngvchnhsachbom (74:210)
                    constraints: BoxConstraints(
                      maxWidth: 260 * fem,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 15 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          letterSpacing: 1.05 * fem,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          const TextSpan(
                            text: 'Tôi đồng ý với các ',
                          ),
                          TextSpan(
                            text: 'Điều khoản sử dụng',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              letterSpacing: 1.05 * fem,
                              color: const Color(0xff04cf86),
                            ),
                          ),
                          const TextSpan(
                            text: ' và ',
                          ),
                          TextSpan(
                            text: 'Chính sách bảo mật',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 15 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              letterSpacing: 1.05 * fem,
                              color: const Color(0xff04cf86),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // groupregister79y (12:99)
              margin: EdgeInsets.fromLTRB(0 * fem, 20 * fem, 0 * fem, 40 * fem),
              child: GestureDetector(
                onTap: () async {
                  // Kiểm tra xem người dùng đã đồng ý với điều khoản và chính sách bảo mật chưa
                  if (isChecked) {
                    try {
                      // Thực hiện đăng ký người dùng
                      User? user = await _authService.signUpWithEmailAndPassword(
                          _gmailController.text, _matKhauController.text);

                      if (user != null) {
                        String uid = user.uid; // Lấy uid của người dùng mới đăng ký
                        String email = _gmailController.text;
                        String isCustomer = email.endsWith('@gmail.com') ? 'Khách hàng' : 'Quản lý';

                        // Tạo đối tượng Users
                        Users users = Users(
                          _hoTenController.text,
                          _gmailController.text,
                          _gioitinhController.text,
                          _matKhauController.text, // Sử dụng uid lấy từ authentication
                          _ngaySinhController.text,
                          isCustomer,
                          _soDienThoaiController.text,
                           uid,
                        );

                        // Lưu thông tin người dùng vào Firestore
                        await FirebaseFirestore.instance
                            .collection('Users')
                            .doc(uid)
                            .set(users.toMap());

                        print("User registration successful: $uid");
                      } else {
                        print("User registration failed");
                      }
                    } catch (e) {
                      print("An error occurred during registration: $e");
                    }
                  } else {
                    // Hiển thị thông báo yêu cầu đồng ý với điều khoản và chính sách bảo mật
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Yêu cầu đồng ý"),
                          content: const Text("Bạn cần đồng ý với điều khoản và chính sách bảo mật để tiếp tục."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Đóng"),
                            ),
                          ],
                        );
                      },
                    );
                  }
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
                      'Đăng ký',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        letterSpacing: 1.4 * fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              // quaylijSF (74:213)
              margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 0*fem, 0*fem),
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
                child: Text(
                  'Quay lại',
                  style: SafeGoogleFont (
                    'Inter',
                    fontSize: 15*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2125*ffem/fem,
                    letterSpacing: 1.05*fem,
                    decoration: TextDecoration.underline,
                    color: const Color(0xff04cf86),
                    decorationColor: const Color(0xff04cf86),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
}
}