// ignore_for_file: dead_code

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myapp/method/function.dart';
import 'package:myapp/view/chitietsanphamKH.dart';
import 'package:myapp/view/user.dart';
import '../model/danhmuc.dart';
import '../model/sanpham.dart';
import '../utils.dart';
import 'cart.dart';
import 'menukhachhang.dart';

class TrangChuKhachHang extends StatefulWidget {
  const TrangChuKhachHang({super.key});

  @override
  State<TrangChuKhachHang> createState() => _TrangChuKhachHangState();
}

class _TrangChuKhachHangState extends State<TrangChuKhachHang> {
  // mặc định trang chủ
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
   KhachHang(),
    SanPhamKhachHang(),
   GioHang(),
  ThongTinCaNhan(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: [
          // const KhachHang(),
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(
                width: 25,
                height: 25,
                child: Image.asset("assets/page-1/images/home-krj.png")
            ),
            label: 'Trang chủ',
            backgroundColor: Color(0xff04cf86),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
              width: 25,
              height: 25,
                child: Image.asset("assets/page-1/images/imageWaterFullRounded_126135.png")
            ),
            label: 'Thực đơn',
            backgroundColor: Color(0xff04cf86),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                width: 25,
                height: 25,
                child: Image.asset("assets/page-1/images/shopping-cart-rxo.png")
            ),
            label: 'Giỏ hàng',
            backgroundColor: Color(0xff04cf86),
          ),
          BottomNavigationBarItem(
            icon: SizedBox(
                width: 25,
                height: 25,
                child: Image.asset("assets/page-1/images/user-solid.png")
            ),
            label: 'Tài khoản',
            backgroundColor: Color(0xff04cf86),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffcf0459),
        onTap: _onItemTapped,
      ),
    );
  }
}

class KhachHang extends StatefulWidget  {
  const KhachHang({super.key});

  @override
  State<KhachHang> createState() => _KhachHangState();
  
}

class _KhachHangState extends State<KhachHang> {
  late User? _user;
  String selectedCategoryId = ''; // Khai báo biến để lưu trữ id danh mục được chọn

  List<bool> isTapped = [];
  late Future<List<SanPham>> _futureSanPham;
  List<SanPham> filteredProducts = [];
  List<DanhMuc> categoriesData = []; // Khai báo categoriesData

  //trạng thái nút bấm Categories
  final List<String> quangcao = [
    'assets/page-1/images/rectangle-8.png',
    'assets/page-1/images/rectangle-8-miP.png',
    'assets/page-1/images/rectangle-9.png',
    'assets/page-1/images/rectangle-10.png',
    'assets/page-1/images/rectangle-11.png',
  ];

// set thời gian ảnh tự động chuyển sang phải (ảnh quảng cáo)
  int currentIndex = 0;
  late Timer _timer;
  late PageController _pageController;
  // biến lưu trữ listview sản phẩm

  @override
  void initState() {
    super.initState();
    initializeStates(0);
    Method.getDataFromMongoDB("Categories").then((value) {
      setState(() {
        categoriesData = value;
      });
    });
    _futureSanPham = Method.laydulieuSP("SanPham");
    _pageController = PageController(initialPage: currentIndex);
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        if (currentIndex < quangcao.length - 1) {
          currentIndex++;
        } else {
          currentIndex = 0;
        }
        _pageController.animateToPage(
          currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
    _getUser();
  }

  // Phương thức để lấy thông tin người dùng từ FirebaseAuth
  void _getUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _user = user; // Cập nhật thông tin người dùng khi có thay đổi trong FirebaseAuth
      });
    });
  }

  // Khởi tạo trạng thái ban đầu cho các item
  void initializeStates(int length) {
    isTapped = List.generate(length, (index) => false);
  }
  // Cập nhật trạng thái của item khi người dùng click
  void updateStateSanPham(int index) {
    // Lấy id của danh mục được chọn

    setState(() {
      // Đặt trạng thái của mục được chọn thành ngược lại của giá trị hiện tại
      selectedCategoryId = isTapped[index] ? categoriesData[index].id : '';

    });
    _getProducts(); // Gọi phương thức để lọc sản phẩm
  }


  // Phương thức để lọc sản phẩm dựa trên danh mục được chọn
  Future<void> _getProducts() async {
    List<SanPham> productsData = await Method.laydulieuSP("SanPham");
    if (selectedCategoryId.isNotEmpty) {
      filteredProducts = productsData.where((product) => product.idCate == selectedCategoryId).toList();
    } else {
      filteredProducts = productsData;
    }
    setState(() {
      _futureSanPham = Future.value(filteredProducts);
    });
  }



  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String uid = _user?.uid ?? 'Unknown';
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.transparent, // Đặt màu nền trong suốt
              elevation: 0, // Loại bỏ độ bóng của Appbar
              pinned: true, // Đảm bảo Appbar được cố định ở đầu trang
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Trang chủ ',style: TextStyle(color: Color(0xff2e2e3e),fontSize: 29),),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child:
                SingleChildScrollView(
                  child: Container(
                    height: 1460,
                    width: double.infinity,
                    child: Container(
                      width: double.infinity,
                      height: 0 ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // componentslideshowVXM (15:378)
                            margin: EdgeInsets.fromLTRB(6*fem, 0*fem, 6*fem, 0*fem),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 244*fem,
                                child: Container(
                                  // frame13zU7 (I15:378;57:34)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 20.17*fem),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom (
                                      padding: EdgeInsets.zero,
                                    ),
                                    child: Container(
                                      width: double.infinity,
                                      height: 223.83*fem,
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        // slideshowJjh (I15:378;57:28)
                                          width: 2339*fem,
                                          height: 222*fem,
                                          decoration: BoxDecoration (
                                            borderRadius: BorderRadius.circular(10*fem),
                                          ),
                                          child: PageView.builder(
                                              controller: _pageController,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: quangcao.length,
                                              itemBuilder: (context, index){
                                                return Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    quangcao[index],
                                                    fit:  BoxFit.cover,
                                                  ),
                                                );
                                              })
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 50*fem),
                            height: 350,
                            child: Column(
                              children: [
                                Container(
                                  height: 75,
                                  child: Expanded(
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(12*fem, 0*fem, 0*fem, 19.5*fem),
                                      width: 613*fem,
                                      height: 1*fem,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.circular(30.0),
                                      ),
                                      child:Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          child: FutureBuilder<List<DanhMuc>>(
                                            future: Method.getDataFromMongoDB("Categories"),
                                            builder: (context, AsyncSnapshot<List<DanhMuc>> snapshot) {
                                              if (snapshot.hasError) {
                                                return Center(child: Text('Error: ${snapshot.error}'));
                                              } else if (snapshot.hasData && snapshot.data != null) {
                                                // print(Method.getDataFromMongoDB("Categories"));
                                                return
                                                  Container(
                                                    child: ListView.builder(
                                                      scrollDirection: Axis.horizontal,
                                                      itemCount: snapshot.data!.length,
                                                      itemBuilder: (context, index) {
                                                        final ds = snapshot.data![index];
                                                        if (isTapped.length <= index) {
                                                          isTapped.add(false); // Khởi tạo giá trị ban đầu cho mỗi mục
                                                        }
                                                        return IntrinsicWidth(
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                // Cập nhật trạng thái của mỗi mục khi được chọn
                                                                for (int i = 0; i < isTapped.length; i++) {
                                                                  isTapped[i] = (i == index);
                                                                }
                                                                // Gọi phương thức updateStateSanPham khi danh mục được chọn
                                                                updateStateSanPham(index);
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 90,
                                                              margin: EdgeInsets.symmetric(horizontal: 5.0 * fem), // Adjust horizontal margin for spacing as needed
                                                              padding: EdgeInsets.only(bottom: 2, left: 10, right: 10, top: 2), // Adjust padding as needed
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(400.0 * fem)), // Set border radius for ellipse shape
                                                                border: Border.all(color: const Color(0xff04cf86)), // Border color
                                                                color: isTapped[index] ? Colors.green : Colors.white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: const Color(0x7f02b273).withOpacity(0.5), // Adjust opacity for softer shadow
                                                                    offset: Offset(2.0 * fem, 4.0 * fem),
                                                                    blurRadius: 2.0 * fem,
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Center(
                                                                widthFactor: 30,
                                                                heightFactor: 10,
                                                                child: Text(
                                                                  ds.Loaisanpham,
                                                                  style: const TextStyle(fontSize: 16.0,), // Adjust font size as needed
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  );
                                              } else {
                                                return const Center(child: Text('No data available'));
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 10,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
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

                                                            decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0))
                                                            ),
                                                            width: 170,
                                                            height: 190,
                                                            child:  ClipRRect(
                                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0)), // Set the same corner radius as the container
                                                              child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container(),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 7),
                                                          Container(
                                                            margin: EdgeInsets.only(left: 20, right: 10),
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
                                                                SizedBox(height: 10),
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
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // rectangle29UQP (39:267)
                            margin: EdgeInsets.fromLTRB(15*fem, 0*fem, 0*fem, 21.22*fem),
                            width: 360*fem,
                            height: 251.78*fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10*fem),
                              child: Image.asset(
                                'assets/page-1/images/rectangle-29.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            // rectangle30aTR (39:272)
                            margin: EdgeInsets.fromLTRB(15*fem, 0*fem, 0*fem, 19.22*fem),
                            width: 360*fem,
                            height: 250.78*fem,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10*fem),
                              child: Image.asset(
                                'assets/page-1/images/rectangle-30.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),

                ),
              ),
          ],

        ),
      ),
    );
  }
}

