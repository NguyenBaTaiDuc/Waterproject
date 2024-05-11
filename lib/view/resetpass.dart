import 'package:flutter/material.dart';
import 'package:myapp/method/firebase_auth.dart';
import 'package:myapp/method/function.dart';
import 'package:myapp/view/login.dart';

class MatKhauMoi extends StatefulWidget {
  MatKhauMoi({super.key});

  @override
  State<StatefulWidget> createState() => _MatKhauMoi();
}

class _MatKhauMoi extends State<MatKhauMoi> {
  FirebaseAuthService authService = FirebaseAuthService();

  final TextEditingController _matkhaucuController = TextEditingController();
  final TextEditingController _matkhaumoiController = TextEditingController();

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
                  controller: _matkhaucuController,
                  decoration: InputDecoration(
                    labelText: 'Nhâp mật khẩu cũ',
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

              Padding(
                padding: const EdgeInsets.only(left: 15, top: 470, right: 15),
                child: TextFormField(
                  controller: _matkhaumoiController,
                  decoration: InputDecoration(
                    labelText: 'Nhâp mật khẩu mới',
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
                        onTap: () async {
                          await Method().resetPassword(_matkhaumoiController.text);
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
            ],
          ),
        ),
      ),
    );
  }
}
