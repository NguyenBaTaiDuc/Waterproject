import 'package:flutter/material.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/thanhtoan.dart';
import '../method/function.dart';
import '../model/giohang.dart';
import '../model/sanpham.dart';

class GioHang extends StatefulWidget {
  const GioHang({super.key});

  @override
  State<GioHang> createState() => GioHangState();
}

class GioHangState extends State<GioHang> {
  List<SanPham> sanPhamList = []; // Biến để lưu trữ danh sách sản phẩm
  late String idSP;
  // tổng giá màn hình
  double Tonggia = 0.0;
  SanPham? chitiet = null;
  List<Cart> _cartList = [];
  @override
  void initState() {
    super.initState();
    _fetchCartData();
    _fetchSPData();
    getTotalPrice();

  }
  // Biến toàn cục để lưu trữ số lượng và giá
  void getTotalPrice() async {
    double price = await Method().calculateTotalPrice('Cart');
    setState(() {
      Tonggia = price.toDouble();
    });
  }

  Future<void> _fetchCartData() async {
    try {
      List<Cart> cartList = await Method().laydulieuCart('Cart');
      setState(() {
        _cartList = cartList;
      });
    } catch (e) {
      // print('Error fetching cart data: $e');
    }
  }

  Future<void> _fetchSPData() async {
    try {
      List<SanPham> cartList = await Method.laydulieuSP('SanPham');
      setState(() {
        sanPhamList = cartList;
      });
    } catch (e) {
      print('Error fetching cart data: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          child: Container(
            // cartR1y (2:9)
            padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
            width: double.infinity,
            decoration: const BoxDecoration (
              color: Color(0xfffcffeb),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 150,
                  // groupheader8SB (74:84)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                  padding: EdgeInsets.fromLTRB(15*fem, 26*fem, 20*fem, 17*fem),
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
                        // autogroupjzdd4UF (KPQrsBRHsxyJTAeQAfjzDD)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // arrowbackroundedBom (74:128)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 230*fem, 0*fem),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 30*fem,
                                  height: 30*fem,
                                  // child: Image.asset(
                                  //   'assets/page-1/images/arrow-back-rounded-Tyy.png',
                                  //   width: 30*fem,
                                  //   height: 30*fem,
                                  // ),
                                ),
                              ),
                            ),
                            TextButton(
                              // homegVd (74:428)
                              onPressed: () {},
                              style: TextButton.styleFrom (
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(top: 25),
                                width: 30*fem,
                                height: 30*fem,
                                child: Image.asset(
                                  'assets/page-1/images/home-9WP.png',
                                  width: 30*fem,
                                  height: 30*fem,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // gihngc8P (74:127)
                        margin: EdgeInsets.fromLTRB(0*fem, 15*fem, 0*fem, 0*fem),
                        child: Text(
                          'Giỏ hàng',
                          style: SafeGoogleFont (
                            'Inter',
                            fontSize: 24*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125*ffem/fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                  Container(
                    margin: const EdgeInsets.only(left: 180),
                    child: Text("${Tonggia.toString()}", style: const TextStyle(fontSize: 21, color: Color(0xff04cf86)),),
                  ),
                const SizedBox(height: 5,),



                Container(
                    width: 395,
                    height: 568,
                    child: FutureBuilder<List<Cart>>(
                      future: Method().laydulieuCart('Cart'),
                      builder: (context, AsyncSnapshot<List<Cart>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError || snapshot.data == null) {
                          return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}'));
                        }
                        else if (snapshot.hasData && snapshot.data != null) {
                          return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final product = snapshot.data?[index];
                            final  idSP = product!.idSP;
                             var gia = product.gia;
                             Tonggia += product.gia;

                              return FutureBuilder<List<SanPham>>(
                                future: Method.laydulieuSPchoCart(idSP),
                                builder: (context, AsyncSnapshot<List<SanPham>> indexSnapshot) {
                                  if (indexSnapshot.connectionState == ConnectionState.waiting) {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                  if (!indexSnapshot.hasData || indexSnapshot.data == null || indexSnapshot.data!.isEmpty) {
                                    // Handle the case where no data is available for the given idSP
                                    return Text('Không có dữ liệu cho idSP: $idSP');
                                  }
                                  final List<SanPham> sanPhams = indexSnapshot.data!;
                                  final SanPham merchandise = sanPhams.first;
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                                    child: Container(
                                      width: 350,
                                      height: 120,
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
                                              },
                                              leading: Container(
                                                width: 70,
                                                height: 70,
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(40),

                                                  child: merchandise.hinhAnh != null ? Image.memory(merchandise.hinhAnh!, fit: BoxFit.cover) : Container(),
                                                ),
                                              ),
                                              title: Container(
                                                margin: const EdgeInsets.only(top: 19, bottom: 6),
                                                child: Text(
                                                  merchandise.tenSanPham,
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
                                                  Text(gia.toString() + " " + "VNĐ", style: const TextStyle(color: Color(0xff02b273)),)
                                                ],
                                              ),
                                              trailing: Column(
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  Positioned(
                                                    left: 135 * fem,
                                                    top: 215 * fem,
                                                    child: Container(
                                                      width: 90 * fem,
                                                      height: 35 * fem,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(20 * fem),
                                                        border: Border.all(color: const Color(0xff04cf86),width: 4),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          buildQuantitySelector(idSP, product, merchandise),
                                                        ],
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
                                  );
                                },
                              );
                            },
                          );
                        } else {
                          return const Center(child: Text('Giỏ hàng của bạn trống '));
                        }
                      },
                    ),
                  ),
                Container(
                  // groupbtnlogout9xT (26:178)
                  margin: EdgeInsets.fromLTRB(79*fem, 5*fem, 80*fem, 0*fem),
                  child: TextButton(
                    onPressed: ()  {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                const ThanhToan()),
                      );
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 44*fem,
                      decoration: BoxDecoration (
                        color: const Color(0xff04cf86),
                        borderRadius: BorderRadius.circular(25*fem),
                      ),
                      child: Center(
                        child: Text(
                          'Thanh toán',
                          style: SafeGoogleFont (
                            'Inter',
                            fontSize: 20*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125*ffem/fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   // gihngcabntrng6pF (26:125)
                //   margin: EdgeInsets.fromLTRB(9*fem, 0*fem, 0*fem, 0*fem),
                //   child: Text(
                //     'Giỏ hàng của bạn trống',
                //     style: SafeGoogleFont (
                //       'Inter',
                //       fontSize: 24*ffem,
                //       fontWeight: FontWeight.w700,
                //       height: 1.2125*ffem/fem,
                //       color: Color(0xff288463),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),

      ),
    );
  }
  Widget buildQuantitySelector(String documentId, Cart cartItem,SanPham sanPham) {
    return FittedBox(
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              // Tăng số lượng
              if (cartItem.soluong > 1) {
                setState(() {
                  cartItem.soluong--; // Giảm số lượng của sản phẩm
                  cartItem.gia = sanPham.gia * cartItem.soluong; // Cập nhật giá sản phẩm
                });
                await Method().updateCart('Cart', cartItem); // Cập nhật dữ liệu vào cơ sở dữ liệu
                getTotalPrice(); // Cập nhật tổng giá
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 7),
                width: 15,
                height: 15,
                child: Image.asset('assets/page-1/images/Minus1.png')),

          ),
          const SizedBox(width: 15,),
          Text(cartItem.soluong.toString(), style: const TextStyle(color: Color(0xff04cf86), fontSize: 20, fontWeight: FontWeight.w600),),
          const SizedBox(width: 15,),
          GestureDetector(
            onTap: () async {
              setState(() {
                cartItem.soluong++; // Tăng số lượng của sản phẩm
                cartItem.gia =sanPham.gia * cartItem.soluong; // Cập nhật giá sản phẩm
              });
              await Method().updateCart('Cart', cartItem); // Cập nhật dữ liệu vào cơ sở dữ liệu
              getTotalPrice(); // Cập nhật tổng giá
            },
            child: Container(
              width: 15,
                height: 15,
                child: Image.asset('assets/page-1/images/plusSP.png')),
          ),
        ],
      ),
    );
  }


}
