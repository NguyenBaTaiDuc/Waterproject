import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/timkiemkhachhang.dart';

import '../method/function.dart';
import '../model/sanpham.dart';
import 'chitietsanphamKH.dart';

class SanPhamKhachHang extends StatefulWidget {
  const SanPhamKhachHang({super.key});

  @override
  State<SanPhamKhachHang> createState() => SanPhamKhachHangState();
}

class SanPhamKhachHangState extends State<SanPhamKhachHang> {
  late Future<List<SanPham>> _futureSanPham;
  late Future<List<SanPham>> _futureSanPhamidCateCF;
  late Future<List<SanPham>> _futureSanPhamidCateNuoc;
  late Future<List<SanPham>> _futureSanPhamidCateSinhTo;
  late Future<List<SanPham>> _futureSanPhamidCateSoda;
  late User? _user;
  // Phương thức để lấy thông tin người dùng từ FirebaseAuth
  void _getUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user; // Cập nhật thông tin người dùng khi có thay đổi trong FirebaseAuth
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureSanPham = Method.laydulieuSP("SanPham");
    _futureSanPhamidCateCF = Method.getDataByIdCateSPCF('SanPham');
    _futureSanPhamidCateNuoc = Method.getDataByIdCateSPNuoc('SanPham');
    _futureSanPhamidCateSinhTo = Method.getDataByIdCateSPSinhTo('SanPham');
    _futureSanPhamidCateSoda = Method.getDataByIdCateSPSoda('SanPham');
    _getUser();
  }
  @override
  Widget build(BuildContext context) {
    String uid = _user?.uid ?? 'Unknown';
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
      const SliverAppBar(
      backgroundColor: Colors.transparent, // Đặt màu nền trong suốt
        elevation: 0, // Loại bỏ độ bóng của Appbar
        pinned: true, // Đảm bảo Appbar được cố định ở đầu trang
        automaticallyImplyLeading: false,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('Menu',style: TextStyle(color: Color(0xff2e2e3e),fontSize: 29),),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                // productWKy (2:8)
                width: double.infinity,
                decoration: const BoxDecoration (
                  color: Color(0xfffcffeb),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TimKiemKhachHang()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        height: 50,
                        width: 360,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(90),
                          border: Border.all(
                            color: Colors.green,
                            width: 3,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Tìm kiếm',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // hottrendV7M (41:69)
                      margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 1*fem, 10*fem),
                      child: Text(
                        'Hot trend',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xff04cf86),
                        ),
                      ),
                    ),

                     Container(
                       margin: const EdgeInsets.only(top: 20,bottom: 20),
                       width: 400,
                        height: 250,
                        child: FutureBuilder<List<SanPham>>(
                          future: _futureSanPham,
                          builder: (context,AsyncSnapshot snapshot) {
                            if (snapshot.hasError || snapshot.data == null) {
                              return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}')); // Hiển thị khi có lỗi xảy ra
                            } else if (snapshot.hasData && snapshot.data != null) {
                              // print(Method.laydulieuSP("SanPham"));
                              // print('Number of items: ${snapshot.data.length}');
                              // for (var product in snapshot.data) {
                              //   print('Product: ${product.tenSanPham}, Price: ${product.gia}');
                              // }
                              // Hiển thị ListView khi dữ liệu đã được tải thành công
                              return
                                // Text(" có dữ liệu");
                                ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:  snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    final product = snapshot.data[index];
                                    return
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChiTietSanPhamKH(id:product.id, idCate: product.idCate, uid: uid,)),
                                          );
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          margin: const EdgeInsets.only(left: 15, bottom: 1, right: 10),
                                          decoration:  const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(10.0),
                                              topLeft: Radius.circular(10.0),
                                              // Adjust corner radius as needed
                                            ),
                                            color: Colors.green,
                                            // Add other decorations like color, border, etc. if needed
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                                                ),
                                                width: 170,
                                                height: 190,
                                                child:  ClipRRect(
                                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0)), // Set the same corner radius as the container
                                                  child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container(),
                                                ),
                                              ),
                                              const SizedBox(height: 7),
                                              Container(
                                                margin: const EdgeInsets.only(left: 20, right: 10),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start, // Căn lề các thành phần về giữa
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      product.tenSanPham,
                                                      style: const TextStyle(color: Colors.pink, fontSize: 15),

                                                      maxLines: 2, // Set the maximum number of lines for wrapping
                                                      overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(product.gia.toString()+ " " +"VNĐ"),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                  },
                                );
                            } else {
                              return const Center(child: Text('No data available'));
                            }
                          },
                        ),

                      ),

                    Container(
                      // trsa4Es (41:73)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 1*fem),
                      child: Text(
                        'Cà phê',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xff04cf86),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20,bottom: 20),
                      width: 400,
                      height: 250,
                      child: FutureBuilder<List<SanPham>>(
                        future: _futureSanPhamidCateCF,
                        builder: (context,AsyncSnapshot snapshot) {
                          if (snapshot.hasError || snapshot.data == null) {
                            return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}')); // Hiển thị khi có lỗi xảy ra
                          } else if (snapshot.hasData && snapshot.data != null) {
                            // print(Method.laydulieuSP("SanPham"));
                            // print('Number of items: ${snapshot.data.length}');
                            // for (var product in snapshot.data) {
                            //   print('Product: ${product.tenSanPham}, Price: ${product.gia}');
                            // }
                            // Hiển thị ListView khi dữ liệu đã được tải thành công
                            return
                              // Text(" có dữ liệu");
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:  snapshot.data.length,
                                itemBuilder: (context, index) {
                                  final product = snapshot.data[index];
                                  return
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChiTietSanPhamKH(id:product.id, idCate: product.idCate, uid: uid,)),
                                        );
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        margin: const EdgeInsets.only(left: 15, bottom: 1, right: 10),
                                        decoration:  const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            // Adjust corner radius as needed
                                          ),
                                          color: Colors.green,
                                          // Add other decorations like color, border, etc. if needed
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(

                                              decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                                              ),
                                              width: 170,
                                              height: 190,
                                              child:  ClipRRect(
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0)), // Set the same corner radius as the container
                                                child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container(),
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Container(
                                              margin: const EdgeInsets.only(left: 20, right: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start, // Căn lề các thành phần về giữa
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.tenSanPham,
                                                    style: const TextStyle(color: Colors.pink, fontSize: 15),

                                                    maxLines: 2, // Set the maximum number of lines for wrapping
                                                    overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(product.gia.toString()+ " " +"VNĐ"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                },
                              );
                          } else {
                            return const Center(child: Text('No data available'));
                          }
                        },
                      ),
                    ),
                    Container(
                      // satiwM9 (41:74)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                      child: Text(
                        'Nước',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xff04cf86),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20,bottom: 20),
                      width: 400,
                      height: 250,
                      child: FutureBuilder<List<SanPham>>(
                        future: _futureSanPhamidCateNuoc,
                        builder: (context,AsyncSnapshot snapshot) {
                          if (snapshot.hasError || snapshot.data == null) {
                            return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}')); // Hiển thị khi có lỗi xảy ra
                          } else if (snapshot.hasData && snapshot.data != null) {
                            // print(Method.laydulieuSP("SanPham"));
                            // print('Number of items: ${snapshot.data.length}');
                            // for (var product in snapshot.data) {
                            //   print('Product: ${product.tenSanPham}, Price: ${product.gia}');
                            // }
                            // Hiển thị ListView khi dữ liệu đã được tải thành công
                            return
                              // Text(" có dữ liệu");
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:  snapshot.data.length,
                                itemBuilder: (context, index) {
                                  final product = snapshot.data[index];
                                  return
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChiTietSanPhamKH(id:product.id, idCate: product.idCate, uid: uid,)),
                                        );
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        margin: const EdgeInsets.only(left: 15, bottom: 1, right: 10),
                                        decoration:  const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            // Adjust corner radius as needed
                                          ),
                                          color: Colors.green,
                                          // Add other decorations like color, border, etc. if needed
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(

                                              decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                                              ),
                                              width: 170,
                                              height: 190,
                                              child:  ClipRRect(
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0)), // Set the same corner radius as the container
                                                child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container(),
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Container(
                                              margin: const EdgeInsets.only(left: 20, right: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start, // Căn lề các thành phần về giữa
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.tenSanPham,
                                                    style: const TextStyle(color: Colors.pink, fontSize: 15),

                                                    maxLines: 2, // Set the maximum number of lines for wrapping
                                                    overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(product.gia.toString()+ " " +"VNĐ"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                },
                              );
                          } else {
                            return const Center(child: Text('No data available'));
                          }
                        },
                      ),

                    ),
                    Container(
                      // trtricyF7V (41:75)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 7*fem),
                      child: Text(
                        'Sinh tố',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xff04cf86),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20,bottom: 20),
                      width: 400,
                      height: 250,
                      child: FutureBuilder<List<SanPham>>(
                        future: _futureSanPhamidCateSinhTo,
                        builder: (context,AsyncSnapshot snapshot) {
                          if (snapshot.hasError || snapshot.data == null) {
                            return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}')); // Hiển thị khi có lỗi xảy ra
                          } else if (snapshot.hasData && snapshot.data != null) {
                            // print(Method.laydulieuSP("SanPham"));
                            // print('Number of items: ${snapshot.data.length}');
                            // for (var product in snapshot.data) {
                            //   print('Product: ${product.tenSanPham}, Price: ${product.gia}');
                            // }
                            // Hiển thị ListView khi dữ liệu đã được tải thành công
                            return
                              // Text(" có dữ liệu");
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:  snapshot.data.length,
                                itemBuilder: (context, index) {
                                  final product = snapshot.data[index];
                                  return
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChiTietSanPhamKH(id:product.id, idCate: product.idCate, uid: uid,)),
                                        );
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        margin: const EdgeInsets.only(left: 15, bottom: 1, right: 10),
                                        decoration:  const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            // Adjust corner radius as needed
                                          ),
                                          color: Colors.green,
                                          // Add other decorations like color, border, etc. if needed
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                                              ),
                                              width: 170,
                                              height: 190,
                                              child:  ClipRRect(
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0)), // Set the same corner radius as the container
                                                child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container(),
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Container(
                                              margin: const EdgeInsets.only(left: 20, right: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start, // Căn lề các thành phần về giữa
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.tenSanPham,
                                                    style: const TextStyle(color: Colors.pink, fontSize: 15),

                                                    maxLines: 2, // Set the maximum number of lines for wrapping
                                                    overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(product.gia.toString()+ " " +"VNĐ"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                },
                              );
                          } else {
                            return const Center(child: Text('No data available'));
                          }
                        },
                      ),
                    ),
                    Container(
                      // cafejhR (41:76)
                      margin: EdgeInsets.fromLTRB(14*fem, 0*fem, 0*fem, 7*fem),
                      child: Text(
                        'Soda',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xff04cf86),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20,bottom: 20),
                      width: 400,
                      height: 250,
                      child: FutureBuilder<List<SanPham>>(
                        future: _futureSanPhamidCateSoda,
                        builder: (context,AsyncSnapshot snapshot) {
                          if (snapshot.hasError || snapshot.data == null) {
                            return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}')); // Hiển thị khi có lỗi xảy ra
                          } else if (snapshot.hasData && snapshot.data != null) {
                            // Hiển thị ListView khi dữ liệu đã được tải thành công
                            return
                              // Text(" có dữ liệu");
                              ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:  snapshot.data.length,
                                itemBuilder: (context, index) {
                                  final product = snapshot.data[index];
                                  return
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChiTietSanPhamKH(id:product.id, idCate: product.idCate, uid: uid,)),
                                        );
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 50,
                                        margin: const EdgeInsets.only(left: 15, bottom: 1, right: 10),
                                        decoration:  const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0),
                                            // Adjust corner radius as needed
                                          ),
                                          color: Colors.green,
                                          // Add other decorations like color, border, etc. if needed
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                                              ),
                                              width: 170,
                                              height: 190,
                                              child:  ClipRRect(
                                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0)), // Set the same corner radius as the container
                                                child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container(),
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Container(
                                              margin: const EdgeInsets.only(left: 20, right: 10),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start, // Căn lề các thành phần về giữa
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    product.tenSanPham,
                                                    style: const TextStyle(color: Colors.pink, fontSize: 15),

                                                    maxLines: 2, // Set the maximum number of lines for wrapping
                                                    overflow: TextOverflow.ellipsis, // Handle overflow with ellipsis
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(product.gia.toString()+ " " +"VNĐ"),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                },
                              );
                          } else {
                            return const Center(child: Text('No data available'));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}
