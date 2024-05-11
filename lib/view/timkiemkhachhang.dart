import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/method/function.dart';
import 'package:myapp/view/chitietsanphamKH.dart';
import 'package:myapp/view/homepage.dart';
import '../method/firebase_auth.dart';
import '../model/sanpham.dart';

class TimKiemKhachHang extends StatefulWidget {
  const TimKiemKhachHang({super.key});
  @override
  State<TimKiemKhachHang> createState() => _TimKiemKhachHangState();
}
class _TimKiemKhachHangState extends State<TimKiemKhachHang> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  late Future<List<SanPham>> _futureSanPham;
  List<SanPham> filteredProducts = [];
  final TextEditingController search = TextEditingController();
  String normalizeString(String input) {
    return input.toLowerCase(); // Chuyển hết sang chữ thường
  }
  @override
  void initState() {
    super.initState();
    _futureSanPham = Method.laydulieuSP("SanPham");
  }
  String searchKey = '';
  void searchProduct(String keyword) {
    setState(() {
      searchKey = keyword;
      if (keyword.isEmpty) {
        // Nếu từ khóa tìm kiếm trống, hiển thị tất cả sản phẩm
        _futureSanPham = Method.laydulieuSP("SanPham");
      } else {
        // Nếu có từ khóa tìm kiếm, lọc danh sách sản phẩm theo từ khóa
        _futureSanPham = Method.laydulieuSP("SanPham").then((productsData) {
          return productsData.where((product) =>
              normalizeString(product.tenSanPham).contains(normalizeString(keyword)))
              .toList();
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Material(
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
                height: 195,
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
                    Positioned(
                      left: 52,
                      width: 156,
                      top: 120,
                      height: 10,
                      child: Container(
                        width: 300,
                        child: TextFormField(
                          onChanged: (value){
                            setState(() {
                              searchKey = value;
                            });
                            searchProduct(value);
                          },
                          controller: search,
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm',
                            hintStyle: const TextStyle(fontSize: 20, color: Color(0xff04cf86)),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(60),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10), // Điều chỉnh khoảng cách giữa nội dung và viền của TextFormField
                            suffixIcon: Container(
                              child: Image.asset(
                                'assets/page-1/images/imageGroupIcsearch_126180.png',
                                width: 40,
                                height: 40,
                              ),
                            ),
                          ),
                        ),
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
                  future: _futureSanPham,
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
                                      User? user =  _authService.getCurrentUser();
                                      String uid = user!.uid;
                                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ChiTietSanPhamKH(id: product.id, idCate: product.idCate, uid: uid)));
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
      ),
    );
  }
}
