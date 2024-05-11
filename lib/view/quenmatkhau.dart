import 'package:flutter/material.dart';
import 'package:myapp/method/firebase_auth.dart';
import 'package:myapp/method/function.dart';
import 'package:myapp/view/login.dart';
import 'package:myapp/view/resetpass.dart';

class QuenMatKhau extends StatefulWidget {
  QuenMatKhau({super.key});

  @override
  State<StatefulWidget> createState() => _QuenMatKhau();
}

class _QuenMatKhau extends State<QuenMatKhau> {
  FirebaseAuthService authService = FirebaseAuthService();

  final TextEditingController _matkhauquenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Container(
          width: 390,
          height: 844,
          decoration: const BoxDecoration(
            color: Color(0xfffcffeb),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 400, right: 15),
                child: TextFormField(
                  controller: _matkhauquenController,
                  decoration: InputDecoration(
                    labelText: 'Nhâp gmail',
                    labelStyle: const TextStyle(
                      color: Color(0xff288463),
                      fontSize: 20,
                      fontFamily: 'TimesNewRoman',
                      fontWeight: FontWeight.normal,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color(0xff288463), // Màu sắc của border
                        width: 10.0, // Độ dày của border
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color(0xff07ce88), // Màu sắc của border khi nhấn vào
                        width: 2.0, // Độ dày của border khi nhấn vào
                      ),
                    ),
                    hintText: '@gmail.com', // Placeholder
                    hintStyle: const TextStyle(
                      color: Colors.grey, // Màu sắc của placeholder
                      fontSize: 16, // Kích thước của placeholder
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // Khoảng cách giữa nội dung và border
                  ),
                ),
              ),

              const Positioned(
                left: 16,
                width: 357,
                top: 343,
                height: 37,
                child: Text(
                  'Nhập email của bạn để nhận mã xác nhận lấy lại mật khẩu',
                  textAlign: TextAlign.center,
                  style: TextStyle(decoration: TextDecoration.none, fontSize: 16, color: Color(0xff04cf86), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                  maxLines: 9999,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                left: 95,
                width: 231,
                top: 780,
                height: 44,
                child: Container(
                  width: 241,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(65),
                  ),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          FirebaseAuthService().resetPassword(_matkhauquenController.text);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    MatKhauMoi()),
                          );
                        },
                        child: Container(
                          width: 231,
                          height: 44,
                          decoration: BoxDecoration(
                            color: const Color(0xff04cf86),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Text(
                              'Lấy lại mật khẩu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 20,
                                color: Color(0xffffffff),
                                fontFamily: 'TimesNewRoman',
                                fontWeight: FontWeight.normal,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 76,
                width: 298,
                top: 290,
                height: 42,
                child: Text(
                  'Quên mật khẩu',
                  textAlign: TextAlign.left,
                  style: TextStyle(decoration: TextDecoration.none, fontSize: 36, color: Color(0xffa0fcdb), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                  maxLines: 9999,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                left: 80,
                width: 229,
                top: 60,
                height: 223,
                child: Image.asset('assets/page-1/images/containerEllipse_153372.png', width: 229, height: 173, fit: BoxFit.fill,),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            const DangNhap()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 680, left: 120),
                  width: 190,
                  height: 100,
                  child: const Positioned(
                    left: 124,
                    top: 794,
                    child: Text(
                      'Quay lại trang đăng nhập',
                      textAlign: TextAlign.left,
                      style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0xff04cf86), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
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
