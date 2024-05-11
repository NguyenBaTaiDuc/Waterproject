import 'package:flutter/material.dart';
import 'package:myapp/view/danhsachdonhang.dart';
import 'package:myapp/view/danhsachnhanvien.dart';
import 'package:myapp/view/danhsachsanphamadmin.dart';
import 'package:myapp/view/login.dart';
import 'package:myapp/view/thongtinphanmem.dart';
class TrangChuAdmin extends StatefulWidget {
  const TrangChuAdmin({super.key});

  @override
  State<StatefulWidget> createState() => _TrangChuAdmin();
}
class _TrangChuAdmin extends State<TrangChuAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        width: 420,
        height: 890,
        decoration: const BoxDecoration(
          color: Color(0xfffcffec),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 33,
              width: 900,
              top: 248,
              height: 526,
              child: Stack(
                children: [
                  Positioned(
                    left: 180,
                    width: 154,
                    top: 216,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ThongTinPhanMem(),
                          ),
                        );
                      },
                      child: SizedBox.expand(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff04cf86),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 29,
                                width: 97,
                                top: 30,
                                height: 139,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 3,
                                      width: 91,
                                      top: 0,
                                      height: 91,
                                      child: Image.asset(
                                        'assets/page-1/images/imageInfoRounded_126164.png',
                                        width: 91,
                                        height: 91,
                                      ),
                                    ),
                                    const Positioned(
                                      left: 0,
                                      width: 97,
                                      top: 91,
                                      height: 48,
                                      child: Text(
                                        'Thông tin ứng dụng',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20,
                                          color: Color(0xffffffff),
                                          fontFamily: 'Inter-Bold',
                                          fontWeight: FontWeight.normal,
                                        ),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 180,
                    width: 154,
                    top: 0,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DanhSachNhanVien(),
                          ),
                        );
                      },
                      child: SizedBox.expand(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff04cf86),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 30,
                                width: 98,
                                top: 40,
                                height: 119,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      width: 91,
                                      top: 0,
                                      height: 91,
                                      child: Image.asset(
                                        'assets/page-1/images/imageSupervisedUserCircle_126147.png',
                                        width: 91,
                                        height: 91,
                                      ),
                                    ),
                                    const Positioned(
                                      left: 2,
                                      top: 95,
                                      child: Text(
                                        'Nhân viên',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20,
                                          color: Color(0xffffffff),
                                          fontFamily: 'Inter-Bold',
                                          fontWeight: FontWeight.normal,
                                        ),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    width: 154,
                    top: 216,
                    height: 200,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DanhSachDonHangAdmin(),
                          ),
                        );
                      },
                      child: SizedBox.expand(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff04cf86),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 30,
                                width: 94,
                                top: 42,
                                height: 115,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 2,
                                      width: 91,
                                      top: 0,
                                      height: 91,
                                      child: Image.asset(
                                        'assets/page-1/images/imageEventNote_126157.png',
                                        width: 91,
                                        height: 91,
                                      ),
                                    ),
                                    const Positioned(
                                      left: 6,
                                      top: 91,
                                      child: Text(
                                        'Đơn hàng',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          decoration: TextDecoration.none,
                                          fontSize: 20,
                                          color: Color(0xffffffff),
                                          fontFamily: 'Inter-Bold',
                                          fontWeight: FontWeight.normal,
                                        ),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    width: 154,
                    top: 0,
                    height: 200,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  DanhSachSanPhamadmin()),
                        );
                      },
                      child: SizedBox.expand(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff04cf86),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 22,
                                width: 111,
                                top: 40,
                                height: 119,
                                child: Stack(
                                  children: [
                                    const Positioned(
                                      left: 0,
                                      width: 111,
                                      top: 96,
                                      height: 23,
                                      child: Text(
                                        'Sản phẩm',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xffffffff), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                                        maxLines: 9999,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Positioned(
                                      left: 10.091,
                                      width: 91,
                                      bottom: 28,
                                      height: 91,
                                      child: Image.asset('assets/page-1/images/imageWaterFullRounded_126135.png', width: 91, height: 91,),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              left: 90,
              width: 231,
              top: 800,
              height: 94,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                           const DangNhap()),
                  );
                },
                child: Container(
                  width: 231,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        width: 231,
                        top: 0,
                        height: 44,
                          child: Container(
                            width: 231,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xff04cf86),
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),

                      ),
                      const Positioned(
                        left: 66,
                        top: 10,
                        child: Text(
                          'Đăng xuất',
                          textAlign: TextAlign.left,
                          style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xffffffff), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                          maxLines: 9999,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 156,
              width: 94,
              top: 99,
              height: 94,
              child: Image.asset('assets/page-1/images/imageEllipse_14129.png', width: 94, height: 94, fit: BoxFit.cover,),
            ),

          ],
        ),
      ),
    );
  }
}
