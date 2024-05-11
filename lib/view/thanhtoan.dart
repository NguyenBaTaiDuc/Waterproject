import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/model/donhang.dart';
import 'package:myapp/model/giohang.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/camon.dart';
import 'package:myapp/view/cart.dart';
import 'package:myapp/view/confirmdelete%C4%90H.dart';
import 'package:myapp/view/diachi.dart';
import 'package:myapp/view/homepage.dart';
import 'package:myapp/view/mapgoogle.dart';

import '../method/function.dart';
import '../model/sanpham.dart';

class ThanhToan extends StatefulWidget {
  const ThanhToan({super.key});

  @override
  State<ThanhToan> createState() => _ThanhToanState();
}

class _ThanhToanState extends State<ThanhToan> {
  List<Cart> cartList = []; // Biến để lưu trữ danh sách sản phẩm trong giỏ hàng

  double totalprice = 0.0;
  void onDeleteSuccess(String id) {
    // Find the index of the deleted product in the cartList
    int index = cartList.indexWhere((product) => product.id == id);
    if (index != -1) {
      // Remove the deleted product from the cartList
      setState(() {
        cartList.removeAt(index);
        updateTotalPrice(); // Call the updateTotalPrice() function here
      });
    }
  }

  List<SanPham> filteredProducts = [];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProducts();
    _getProductsFromCart();
    _addressController = TextEditingController(text: DiaChiCungCap.selectedAddress ?? '');
  }

  Future<void> _getProductsFromCart() async {
    try {
      List<Cart> productsData = await Method().laydulieuCart("Cart");
      setState(() {
        cartList = productsData;
        updateTotalPrice();
      });
    } catch (e) {
      print("Error fetching products from Cart: $e");
    }
  }
  void updateTotalPrice() {
    // Tính lại tổng giá từ danh sách sản phẩm trong giỏ hàng
    double newTotalPrice = 0.0; // Gán totalprice bằng 0 trước khi tính toán lại
    // Tính tổng giá từ danh sách sản phẩm
    cartList.forEach((product) {
      newTotalPrice += product.gia;
    });
    // Cập nhật lại giá trị của totalprice
    setState(() {
      totalprice = newTotalPrice;
    });
  }


  late TextEditingController _addressController;
  // TextEditingController _addressController = TextEditingController();
  Future<void> _getProducts() async {
    List<Map<String, dynamic>> productsData = (await Method().laydulieuCart("Cart")).cast<Map<String, dynamic>>();
    filteredProducts = productsData.cast<SanPham>();
    // Sắp xếp danh sách sản phẩm nếu cần thiết
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SingleChildScrollView(
      child: Material(
        child: Container(
          width: double.infinity,
          child: Container(
            // cartprHRy (85:24)
            width: double.infinity,
            decoration: const BoxDecoration (
              color: Color(0xfffcffeb),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 170,
                  // groupheadercz3 (85:25)
                  padding: EdgeInsets.fromLTRB(0*fem, 6*fem, 15*fem, 25*fem),
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
                        // autogroupc85moHq (KPQutWYpDv1GQDTgT2c85m)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // arrowbackroundedXUj (85:89)
                              margin: EdgeInsets.fromLTRB(10*fem, 45*fem, 235*fem, 0*fem),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const GioHang()),
                                  );
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Container(
                                  width: 40*fem,
                                  height: 40*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/arrow-back-rounded-k4w.png',
                                    width: 30*fem,
                                    height: 30*fem,
                                  ),
                                ),
                              ),
                            ),
                            TextButton(
                              // homebUb (85:91)
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
                                margin: EdgeInsets.only(top: 40),
                                width: 30*fem,
                                height: 30*fem,
                                child: Image.asset(
                                  'assets/page-1/images/home-17M.png',
                                  width: 30*fem,
                                  height: 30*fem,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        // thanhtonWrT (85:68)
                        'Thanh toán',
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 24*ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2125*ffem/fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 180),
                  child:  Text(totalprice.toString(),style: const TextStyle(fontSize: 24),),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  // autogrouptzcx3Lb (KPQu8s8sXTdZVt8ihutzCX)
                  padding: EdgeInsets.fromLTRB(20*fem, 0*fem, 0*fem, 22*fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 375,
                        height: 418,
                        child: FutureBuilder<List<Cart>>(
                          future: Method().laydulieuCart('Cart'),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            }
                            if (snapshot.hasError || snapshot.data == null) {
                              return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}'));
                            }
                            else if (snapshot.hasData && snapshot.data != null) {
                              return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, doc) {
                                  final product = snapshot.data![doc];
                                  final idSP = product?.idSP;
                                  final gia = product?.gia;
                                  final soluong = product?.soluong;
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
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Container(
                                          width: 200,
                                          height: 80,
                                          margin: const EdgeInsets.only(top: 4),
                                          child: ClipRRect(
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(60),
                                              bottomRight: Radius.circular(60),
                                            ),
                                            child: Container(
                                              height: 20,
                                              color: Colors.green,
                                              child: Card(
                                                child: ListTile(
                                                  tileColor: const Color(0xfffcffec),
                                                  visualDensity: const VisualDensity(vertical: 4),
                                                  onTap: () {
                                                  },
                                                  leading: Container(
                                                    margin: const EdgeInsets.only(bottom: 20),
                                                    width: 50,
                                                    height: 50,
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(40),
                                                      child: merchandise.hinhAnh != null ? Image.memory(merchandise.hinhAnh!, fit: BoxFit.cover) : Container(),
                                                    ),
                                                  ),
                                                  title: Container(
                                                    margin: const EdgeInsets.only(top: 10, bottom: 6),
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
                                                      Text("Số lượng : " + soluong.toString(), style: const TextStyle(color: Color(0xff02b273)),)
                                                    ],
                                                  ),
                                                  trailing: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async{
                                                          await Method().deleteDonHang('Cart', product?.id);
                                                          onDeleteSuccess(product?.id);
                                                          updateTotalPrice();
                                                          // showDialog(
                                                          //     context: context,
                                                          //     builder: (BuildContext context){
                                                          //       return ConfirmationDialogDH(collectionName: 'Cart', id: product['_id'], onDeleteSuccess: updateTotalPrice, productName: merchandise.tenSanPham );
                                                          //
                                                          //     });
                                                        },
                                                        child: Container(
                                                          margin: const EdgeInsets.fromLTRB(0, 0 , 16, 13),
                                                          width: 19,
                                                          height: 19,
                                                          child: Image.asset("assets/page-1/images/delete.png",fit:  BoxFit.cover,),
                                                        ),
                                                      ),
                                                      Text(gia.toString() + " " + "VNĐ", style: const TextStyle(color: Color(0xff02b273)),)

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
                      const SizedBox(height: 20), // Khoảng cách giữa phần tiêu đề và TextFormField
                      // TextFormField hiển thị địa chỉ
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _addressController,
                                decoration: const InputDecoration(
                                  labelText: 'Địa chỉ',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.map),
                              onPressed: () async {
                                // Mở màn hình bản đồ và chờ người dùng chọn địa chỉ
                                final selectedAddress = await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MapPage()),
                                );
                                // Nếu người dùng đã chọn địa chỉ, cập nhật giá trị của TextFormField
                                if (selectedAddress != null) {
                                  setState(() {
                                    _addressController.text = selectedAddress;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20), // Khoảng cách giữa TextFormField và các phần khác
                      Container(
                        // phngthcthanhton1u1 (85:93)
                        margin: EdgeInsets.fromLTRB(21*fem, 0*fem, 0*fem, 26*fem),
                        child: Text(
                          'Phương thức thanh toán :\n',
                          style: SafeGoogleFont (
                            'Inter',
                            fontSize: 16*ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125*ffem/fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()async{
                          await Method().moveDataFromCartToBill('Cart', 'Bill',totalprice,'Thanh toán trực tuyến', _addressController.text,"Đã thanh toán");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Camon()),
                          );
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PaypalCheckout(
                                  sandboxMode: true,
                                  clientId: "AVxB-eik960CrMqWyb_9WRkg1IDWN1ciyDlX9Mix5iB-AAuLWx6_k-5liXHNud89grosN5rIjmO1NQjT",
                                  secretKey: "EJ2Kh6nybzZo2Ra5_wrrLe-XKF4wCavDjIVxnSN9iO3g6NWkO75rDRgxsI_s-AQduOlh_x3RwLzBGIXY",
                                  returnURL: "/customer_home",
                                  cancelURL: "cancel.snippetcoder.com",
                                  transactions:  [
                                    {
                                      "amount": {
                                        "total": totalprice,
                                        "currency": "USD",
                                        "details": {
                                          "subtotal": totalprice,
                                          "shipping": 0,
                                          "shipping_discount": 0
                                        }
                                      },
                                      "description": "The payment transaction description.",
                                    }
                                  ],
                                  note: "PAYMENT_NOTE",
                                  onSuccess: (Map params) async {
                                    print("onSuccess: $params");

                                  },
                                  onError: (error) {
                                    print("onError: $error");
                                    Navigator.pop(context);
                                  },
                                  onCancel: () {
                                    print('cancelled:');
                                    Navigator.of(context).pop();
                                  },
                                ),

                          ));
                        },
                        child: Container(
                          // vmomodQb (85:95)
                          margin: EdgeInsets.fromLTRB(21*fem, 0*fem, 0*fem, 18*fem),
                          child: Text(
                            'PayPal\n',
                            style: SafeGoogleFont (
                              'Inter',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: ()async{
                          await Method().moveDataFromCartToBill('Cart', 'Bill', totalprice,'Thanh toán tiền mặt', _addressController.text, "Đã đặt haàng");
                          Fluttertoast.showToast(msg: "Đặt hàng thành công, thanh toán sau khi nhận hàng");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Camon()),
                          );
                        },
                        child: Container(
                          // thanhtonkhinhnhngZ3M (85:96)
                          margin: EdgeInsets.fromLTRB(21*fem, 0*fem, 0*fem, 0*fem),
                          child: Text(
                            'Tiền mặt\n',
                            style: SafeGoogleFont (
                              'Inter',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0xff000000),
                            ),
                          ),
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
    );
  }
}
