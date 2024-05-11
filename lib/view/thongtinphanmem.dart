import 'package:flutter/material.dart';

import 'admin.dart';
class ThongTinPhanMem extends StatefulWidget {
  ThongTinPhanMem({super.key});

  @override
  State<StatefulWidget> createState() => _ThongTinPhanMem();
}

class _ThongTinPhanMem extends State<ThongTinPhanMem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: 412,
        height: 844,
        decoration: const BoxDecoration(
          color: Color(0xfffcffec),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              width: 412,
              top: 0,
              height: 295,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 412,
                    top: 0,
                    height: 185,
                    child: Container(
                      width: 390,
                      height: 202,
                      decoration: const BoxDecoration(
                        color: Color(0xff04cf86),
                        boxShadow: [BoxShadow(color: Color(0x3f02b273), offset: Offset(0, 4), blurRadius: 4),],
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(75),
                            bottomLeft:  Radius.circular(75),
                          )
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 90,
                    width: 268,
                    top: 65,
                    height: 30,
                    child: Text(
                      'Thông tin về ứng dụng',
                      textAlign: TextAlign.left,
                      style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xffffffff), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(top: 60),
                      child: Positioned(
                        left: 15,
                        width: 50,
                        top: 65,
                        height: 50,
                        child: Image.asset(
                          'assets/page-1/images/imageArrowBackRounded_126174.png',
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 125,
              width: 152,
              top: 99,
              height: 152,
              child: Image.asset('assets/page-1/images/containerEllipse_153372.png', width: 152, height: 152, fit: BoxFit.cover,),
            ),
            const Positioned(
              left: 65,
              width: 283,
              top: 301,
              height: 242,
              child: Text(
                'Ứng dụng bán nước giải khát\n\nVersion 1.0.0\n\nỨng dụng hỗ trợ người dùng quản lí sản phẩm, đơn hàng, nhân viên và và giúp cho khác hàng thuận tiện trong việc lựa chọn và đặt hàng mọi lúc mọi nơi.',
                textAlign: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                maxLines: 9999,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Positioned(
              left: 45,
              width: 326,
              top: 770,
              height: 39,
              child: Text(
                'Đ/c: 828 Đ. Sư Vạn Hạnh, Phường 12, Quận 10, Thành phố Hồ Chí Minh, Việt Nam',
                textAlign: TextAlign.center,
                style: TextStyle(decoration: TextDecoration.none, fontSize: 17, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.w500),
                maxLines: 9999,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Positioned(
              left: 105,
              width: 204,
              top: 549,
              height: 204,
              child: Image.asset('assets/page-1/images/containerGroup_16836.png', width: 204, height: 204,),
            ),
          ],
        ),
      ),
    );
  }
}
