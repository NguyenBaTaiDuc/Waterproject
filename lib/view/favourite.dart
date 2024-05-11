import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/method/function.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/confirmdeleteyeuhich.dart';
import 'package:myapp/view/homepage.dart';
import 'package:myapp/view/user.dart';

import '../model/sanpham.dart';

class YeuThich extends StatefulWidget {
  const YeuThich({super.key});

  @override
  State<YeuThich> createState() => _YeuThichState();
}

class _YeuThichState extends State<YeuThich> {
  void onDeleteSuccess() {
    // Thực hiện các thao tác cần thiết sau khi xóa sản phẩm thành công
    // Ví dụ: Load lại danh sách sản phẩm
    setState(()  {
      _getProductsYeuTich();
    });
  }
  Future<void> _getProductsYeuTich() async {
    // Sắp xếp danh sách sản phẩm nếu cần thiết
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // favourite5su (76:220)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xfffcffeb),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 170,
              // groupheaderbLT (74:288)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
              padding: EdgeInsets.fromLTRB(15*fem, 30.6*fem, 15*fem, 17*fem),
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
                    // autogroupakhdXtK (KPQmjKyb6zxAipKgtvAkhd)
                    margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 15*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // arrowbackroundedGL7 (74:437)
                          margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 225*fem, 1*fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              width: 40*fem,
                              height: 40*fem,
                              child: Image.asset(
                                'assets/page-1/images/arrow-back-rounded.png',
                                width: 30*fem,
                                height: 30*fem,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          // homekWB (74:439)
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
                            margin: const EdgeInsets.only(top:  5),
                            width: 30*fem,
                            height: 30*fem,
                            child: Image.asset(
                              'assets/page-1/images/home-1SP.png',
                              width: 30*fem,
                              height: 30*fem,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    // danhschyuthchUwy (74:331)
                    'Danh sách yêu thích',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 24*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125*ffem/fem,
                      color: const Color(0xffffffff),
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            // ở đây
            Container(
              margin: const EdgeInsets.only(right: 1),
              width: 400,
              height: 629,
              child: FutureBuilder<List<SanPham>>(
                future: Method().fetchSanPhamFavorite(),
                builder: (context, AsyncSnapshot snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center( child: CircularProgressIndicator());
                  }
                  print(snapshot.data);
                    if (!snapshot.hasData || snapshot.data == 0 ) {
                      return const Center(child: Text('Danh sách yêu thích trống', style: TextStyle(fontSize: 24, decoration: TextDecoration.none, color: Color(0xff04cf86)),));
                    }
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data[index];
                        return Container(
                          width: 350,
                          height: 100,
                          margin: const EdgeInsets.only(top: 4),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60),

                            ),

                            child: Container(
                              color: Colors.green,
                              child: Card(
                                child: ListTile(
                                    tileColor: const Color(0xfffcffec),
                                    visualDensity: const VisualDensity(vertical: 4),
                                    onTap: () {
                                      // Đoạn code xử lý khi tap vào
                                    },
                                    leading: Container(
                                      width: 70,
                                      height: 70,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(40),
                                        child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container(),
                                      ),
                                    ),
                                    title: Container(
                                      margin: const EdgeInsets.only(top: 19, bottom: 6),
                                      child: Text(
                                        product.tenSanPham,
                                        style: const TextStyle(
                                          fontFamily: 'TimesNewRoman',
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff028053),
                                        ),
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(product.gia.toString() + " " + "VNĐ", style: const TextStyle(color: Color(0xff02b273)),)
                                      ],
                                    ),
                                    trailing: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (BuildContext context){
                                                  return
                                                    ConfirmationDialogYeuThich(id: product.id,collectionName: 'SanPham', onDeleteSuccess: onDeleteSuccess, productName: product.tenSanPham, );

                                                });
                                            // Đoạn code xử lý khi tap vào
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.fromLTRB(12, 15, 20, 25),
                                            width: 32,
                                            height: 32,
                                            child: Image.asset("assets/page-1/images/delete.png", fit: BoxFit.cover,),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );

                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
