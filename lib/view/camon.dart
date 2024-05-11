import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:myapp/view/homepage.dart';
class Camon extends StatefulWidget {
  const Camon({super.key});

  @override
  State<StatefulWidget> createState() => _Camon();
}
class _Camon extends State<Camon> {
  Map payload = {};
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    if(message is RemoteMessage)  {
      payload = message.data;
    }
    return Material(
      child: Container(
        color: Colors.white,
        child:
        Container(
          width: 412,
          height: 874,
          decoration: const BoxDecoration(
            color: Color(0xfffcffeb),
          ),
          child:

          Stack(
            children: [
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TrangChuKhachHang()),
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
                              'Quay về trang chủ',
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
                left: 56,
                width: 298,
                top: 450,
                height: 100,
                child: Text(
                  'Bạn đã thanh toán \n      thành công',
                  textAlign: TextAlign.left,
                  style: TextStyle(decoration: TextDecoration.none, fontSize: 36, color: Color(
                      0xffe70808), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                  maxLines: 9999,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Positioned(
                left: 56,
                width: 298,
                top: 350,
                height: 100,
                child: Image.asset('assets/page-1/images/thanhtoanthanhcong.png',)
              ),
              Positioned(
                left: 90,
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
                        const TrangChuKhachHang()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
