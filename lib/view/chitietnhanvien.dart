

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:myapp/model/nhanvien.dart';
import 'package:myapp/model/sanpham.dart';
import 'package:myapp/view/danhsachnhanvien.dart';
import 'package:myapp/view/danhsachsanphamadmin.dart';

import '../method/function.dart';
class ThongTinChiTietNV extends StatefulWidget {
  final String id;
  const ThongTinChiTietNV({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _ThongTinChiTietNV();
}

class _ThongTinChiTietNV extends State<ThongTinChiTietNV> {
  NhanVien? detailsNV;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductdetailsNV();
  }
  void _getProductdetailsNV() async{
    try{
      detailsNV = await Method.getDataByIdNV(widget.id, 'NhanVien');
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
                    left: 120,
                    width: 233,
                    top: 65,
                    height: 30,
                    child: Text(
                      'Thông tin chi tiết nhân viên',
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
                                DanhSachNhanVien()),
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
              left: 130,
              width: 153,
              top: 191,
              height: 153,
              child: Image.memory(
                detailsNV!.hinhAnhNV ?? Uint8List(0),
                width: 153, // Kích thước của ảnh
                height: 153,
                fit: BoxFit.cover, // Định dạng của ảnh để vừa với kích thước được cung cấp
              ),
            ),
            Positioned(
              left: 19,
              width: 450,
              top: 380,
              height: 303,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Text(
                      'Tên nhân viên: ${detailsNV?.tenNV}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(decoration: TextDecoration.none, fontSize: 23, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.w400),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 45,
                    child: Text(
                      'Ngày sinh: ${detailsNV?.ngaysinh}',
                      textAlign: TextAlign.left,
                      style: const TextStyle(decoration: TextDecoration.none, fontSize: 23, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.w400),
                      maxLines: 9999,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    width: 415,
                    top: 137,
                    height: 24,
                    child: Stack(
                      children: [
                        const Positioned(
                          left: 0,
                          top: 0,
                          child: Text(
                            'Số điện thoại:',
                            textAlign: TextAlign.left,
                            style: TextStyle(decoration: TextDecoration.none, fontSize: 23, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                            maxLines: 9999,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Positioned(
                          left: 53,
                          width: 412,
                          top: 2,
                          height: 24,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 90,
                                width: 512,
                                top: 0,
                                height: 24,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Text(
                                        detailsNV!.sdtNV,
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
                    width: 412,
                    top: 87,
                    height: 34,
                    child: Container(
                      width: 194,
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 0,
                            top: 3,
                            child: Text(
                              'Gmail :',
                              textAlign: TextAlign.left,
                              style: TextStyle(decoration: TextDecoration.none, fontSize: 23, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.w400),
                              maxLines: 9999,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Positioned(
                            left: 76,
                            width: 412,
                            top: 0,
                            height: 34,
                            child: Container(
                              width: 412,
                              height: 34,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0,
                                    top: 3,
                                    child: Text(
                                      detailsNV!.gmail,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(decoration: TextDecoration.none, fontSize: 23, color: Color(0xff288463), fontFamily: 'Inter-Regular', fontWeight: FontWeight.normal),
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
