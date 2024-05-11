import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:myapp/model/sanpham.dart';
import 'package:myapp/view/danhsachsanphamadmin.dart';
import '../method/function.dart';
class ThongTinChiTietSanPhamAdmin extends StatefulWidget {
  final String id;
  const ThongTinChiTietSanPhamAdmin({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _ThongTinChiTietSanPhamAdmin();
}

class _ThongTinChiTietSanPhamAdmin extends State<ThongTinChiTietSanPhamAdmin> {
   SanPham? details= null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductdetails();
  }
  void _getProductdetails() async{
    try{
      details = await Method.getDataById(widget.id, 'SanPham');
      setState(() {

      });
    }catch(e){
      print('Error: $e');
    }
  }

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
              height: 155,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    width: 412,
                    top: 0,
                    height: 155,
                    child: Container(
                      width: 412,
                      height: 155,
                      decoration: const BoxDecoration(
                        color: Color(0xff04cf86),
                        boxShadow: [BoxShadow(color: Color(0x3f02b273), offset: Offset(0, 4), blurRadius: 4),],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(75),
                          bottomLeft:  Radius.circular(75),
                        ),
                      ),
                    ),
                  ),

                  const Positioned(
                    left: 95,
                    width: 233,
                    top: 65,
                    height: 30,
                    child: Text(
                      'Thông tin sản phẩm',
                      textAlign: TextAlign.left,
                      style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xffffffff), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                               DanhSachSanPhamadmin()),
                      );
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
              left: 118,
              width: 153,
              top: 191,
              height: 153,
              child: Image.memory(
                details!.hinhAnh ?? Uint8List(0),
                width: 153, // Kích thước của ảnh
                height: 153,
                fit: BoxFit.cover, // Định dạng của ảnh để vừa với kích thước được cung cấp
              ),
            ),
            Positioned(
              left: 15,
              width: 360,
              top: 380,
              height: 303,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      'Tên: ${details?.tenSanPham}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 29,
                    child: Text(
                      'Đơn giá: ${details?.gia}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    width: 360,
                    top: 116,
                    height: 187,
                    child: Container(
                      width: 360,
                      height: 187,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            width: 360,
                            top: 29,
                            height: 158,
                            child: Container(
                              width: 360,
                              height: 158,
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                border: Border.all(color: const Color(0xff02b273), width: 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 13,
                            width: 334,
                            top: 54,
                            height: 108,
                            child: Text(
                              details!.moTa,
                              textAlign: TextAlign.left,
                              style: const TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                              maxLines: 9999,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'Mô tả:',
                              textAlign: TextAlign.left,
                              style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                              maxLines: 9999,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    width: 155,
                    top: 87,
                    height: 24,
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 0,
                          top: 0,
                          child: Text(
                            'Size:',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          left: 53,
                          width: 99,
                          top: 0,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                width: 45,
                                top: 0,
                                height: 24,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Text(
                                        details!.kichThuoc,
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
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
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    width: 194,
                    top: 58,
                    height: 24,
                    child: Container(
                      width: 194,
                      height: 24,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'Danh mục:',
                              textAlign: TextAlign.left,
                              style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                              maxLines: 9999,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Positioned(
                            left: 111,
                            width: 83,
                            top: 0,
                            height: 24,
                            child: Container(
                              width: 83,
                              height: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    width: 83,
                                    top: 0,
                                    height: 24,
                                    child: Container(
                                      width: 83,
                                      height: 24,
                                      decoration: BoxDecoration(
                                        color: const Color(0xfffcffec),
                                        border: Border.all(color: const Color(0xff288463), width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 16,
                                    top: 3,
                                    child: Text(
                                      details!.idCate,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
                                      maxLines: 9999,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
