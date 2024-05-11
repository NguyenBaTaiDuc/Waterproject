import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:myapp/model/nhanxet.dart';
import 'package:myapp/model/sanpham.dart';
import 'package:myapp/model/users.dart';
import 'package:myapp/model/yeuthich.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/homepage.dart';
import '../method/function.dart';
import '../model/giohang.dart';

class ChiTietSanPhamKH extends StatefulWidget {
  final String id;
  final String idCate;
  final String uid;
  const ChiTietSanPhamKH({super.key, required this.id, required this.idCate, required this.uid});

  @override
  State<ChiTietSanPhamKH> createState() => _ChiTietSanPhamKHState();
}

class _ChiTietSanPhamKHState extends State<ChiTietSanPhamKH> {
  final TextEditingController _comment = TextEditingController();
  int quantity = 1;
  double firstcost =0;
  double tonggia1sp = 0;
  SanPham? chitiet = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductdetails();
  }
  // Hàm để cập nhật tổng giá của sản phẩm
  void _updateTotalPrice() {
    setState(() {
      tonggia1sp = firstcost * quantity;
    });
  }
  void _getProductdetails() async{
    try{
      chitiet = await Method.getDataById(widget.id, 'SanPham');
      firstcost = chitiet!.gia;
      _updateTotalPrice();
      // print(firstcost);
      // print(widget.id);
      setState(() {

      });
    }catch(e){
      print('Error: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 20), // Điều chỉnh bottom padding theo bàn phím và thêm một khoảng trống bổ sung
        physics: const ClampingScrollPhysics(),
        reverse: true,
        child: Container(
          width: double.infinity,
          child: Container(
            // product26B (68:20)
            width: double.infinity,
            height: 844*fem,
            decoration: const BoxDecoration (
              color: Color(0xfffcffeb),
            ),
            child: Stack(
              children: [
                Positioned(
                  // autogroupgrsbW1M (KPQiKveWZStJYN1SyNGrSb)
                  left: 0*fem,
                  top: 0*fem,
                  child: Container(
                    width: 390*fem,
                    height: 268*fem,
                    child: Stack(
                      children: [
                        Positioned(
                          // rectangle41Q6j (71:310)
                          left: 0*fem,
                          top: 0*fem,
                          child: Align(
                            child: SizedBox(
                              width: 390*fem,
                              height: 238*fem,
                              child: Container(
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
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // arrowbackroundedf2f (74:16)
                          left: 15*fem,
                          top: 67*fem,
                          child: Align(
                            child: SizedBox(
                              width: 30*fem,
                              height: 30*fem,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom (
                                  padding: EdgeInsets.zero,
                                ),
                                child: Image.asset(
                                  'assets/page-1/images/arrow-back-rounded-nhD.png',
                                  width: 30*fem,
                                  height: 30*fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            YeuThich yeuthich = YeuThich(widget.id, widget.idCate, widget.uid);
                         await   Method().insertDataYeuThich('YeuThich', yeuthich);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 360, top: 73),
                            child: Positioned(
                              left: 34.5 * fem,
                              top: 29.3125 * fem,
                              child: SizedBox(
                                width: 30 * fem,
                                height: 30 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/favorite-outline.png',
                                  width: 25 * fem,
                                  height: 22.94 * fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          // ellipse12SxX (74:20)
                          left: 128 * fem,
                          top: 74 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 134 * fem,
                              height: 134 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle, // Đặt hình dạng của container thành hình tròn
                                  border: Border.all(color: const Color(0xff04cf86)),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(67 * fem), // Đặt bo góc cho hình ảnh
                                  child: Image.memory(
                                    chitiet?.hinhAnh ?? Uint8List(0),
                                    fit: BoxFit.cover, // Đảm bảo hình ảnh đầy đủ phủ trên mọi phần của hình tròn
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                        Positioned(
                          left: 135 * fem,
                          top: 215 * fem,
                          child: Container(
                            width: 120 * fem, // Điều chỉnh chiều rộng theo nhu cầu của bạn
                            height: 35 * fem, // Điều chỉnh chiều cao theo nhu cầu của bạn
                            decoration: BoxDecoration(
                              color: Colors.white, // Màu nền của khung là trắng
                              borderRadius: BorderRadius.circular(20 * fem), // Đặt bo tròn cho khung
                              border: Border.all(color: const Color(0xff04cf86),width: 4), // Viền màu xanh lá cây
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Giảm số lượng sản phẩm
                                      if (quantity > 1) {
                                        quantity--;
                                        _updateTotalPrice();
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 40 * fem,
                                    height: 40 * fem,
                                    child: const Center(
                                      child: Icon(Icons.remove, color: Color(0xff04cf86),size: 34,),
                                    ),
                                  ),
                                ),
                                Text(
                                  quantity.toString(), // Hiển thị số lượng sản phẩm
                                  style: const TextStyle(fontSize: 20, color: Color(0xff04cf86),fontWeight: FontWeight.w600),

                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      // Tăng số lượng sản phẩm
                                      quantity++;
                                      _updateTotalPrice();
                                    });
                                  },
                                  child: Container(
                                    width: 40 * fem,
                                    height: 40 * fem,
                                    child: const Center(
                                      child: Icon(Icons.add, color: Color(0xff04cf86),size: 30,),

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
                ),
                Positioned(
                  // autogroupgu6b5AF (KPQixA7914WFdxCsZ4GU6b)
                  left: 0*fem,
                  top: 741*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(44*fem, 11*fem, 45*fem, 22*fem),
                    width: 390*fem,
                    height: 103*fem,
                    child: TextButton(
                      // groupaddtocartBDH (74:24)
                      onPressed: () async {
                        String id = Method().generateId();
                        Cart cart = Cart(id , widget.uid, widget.id, quantity, tonggia1sp);
                        print(widget.uid);
                        await Method().insertDataCart('Cart', cart);
                        // await Method().calculateTotalPrice('Cart');
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration (
                          color: const Color(0xff04cf86),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: Center(
                          child: Text(
                            'Thêm vào giỏ hàng',
                            style: SafeGoogleFont (
                              'Inter',
                              fontSize: 20*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  // autogroupekpoExF (KPQj8eoekt2GPyJyscekpo)
                  left: 0*fem,
                  top: 243*fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15*fem, 21*fem, 10*fem, 4*fem),
                    width:400*fem,
                    height: 600*fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // autogroupvdbmLEb (KPQigkP9WAgxsaL1mPvdbm)
                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // trsathantreFcT (74:60)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 65*fem, 0*fem),
                                child: Text(
                                  chitiet!.tenSanPham,
                                  style: SafeGoogleFont (
                                    'TimesNewRoman',
                                    fontSize: 25*ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2125*ffem/fem,
                                    color: const Color(0xff288463),
                                    decoration: TextDecoration.none
                                  ),
                                ),
                              ),
                              Text(
                                // ADd (89:26)
                                "${tonggia1sp} VNĐ",
                                style: SafeGoogleFont (
                                  'Inter',
                                  fontSize: 20*ffem,
                                  fontWeight: FontWeight.w700,
                                  height: 1.2125*ffem/fem,
                                  color: const Color(0xff04cf86),
                                    decoration: TextDecoration.none
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogrouphkwhtfR (KPQiofMJ4Fkd7qnbPZHkwH)
                          margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 139*fem, 5*fem),
                          width: double.infinity,
                          height: 34*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // groupsizemDBu (74:158)
                                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom (
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    width: 106*fem,
                                    height: double.infinity,
                                    decoration: BoxDecoration (
                                      color: const Color(0xff04cf86),
                                      borderRadius: BorderRadius.circular(20*fem),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Size ${chitiet!.kichThuoc}',
                                        style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 15*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.2125*ffem/fem,
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: Text(
                            // toppingwGK (74:172)
                            'Mô tả',
                            style: SafeGoogleFont (
                              'Inter',
                              fontSize: 25*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0xff288463),
                              decoration: TextDecoration.none
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top:  5),
                          width: 390,
                          height:390,
                          child: Text(
                            chitiet!.moTa,
                            style:
                            const TextStyle(
                                fontSize: 16,
                                color: Color(0xff04cf86),
                                decoration: TextDecoration.none,
                              height: 1.5,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  width: 381,
                  top: 610,
                  height: 170,
                  child: Container(
                    margin: const EdgeInsets.only(top: 50, bottom: 50), // Thêm margin chỉ xuống
                    width: 360,
                    height: 148,
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: const Color(0xff02b273), width: 1),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    child: TextFormField(
                      controller: _comment,
                      decoration: InputDecoration(
                        labelText: 'Nhận xét',
                        labelStyle: const TextStyle(
                          color: Color(0xff288463),
                          fontSize: 20,
                          fontFamily: 'TimesNewRoman',
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xff02b273),
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color(0xff07ce88),
                            width: 2,
                          ),
                        ),
                      ),
                      maxLines: 5, // Đặt số dòng tối đa
                    ),
                  ),
                ),
                Positioned(
                  // autogroupgu6b5AF (KPQixA7914WFdxCsZ4GU6b)
                  left: 250*fem,
                  top: 700*fem,
                  child: Container(
                    // padding: EdgeInsets.fromLTRB(44*fem, 11*fem, 45*fem, 22*fem),
                    width: 100*fem,
                    height: 40*fem,
                    child: TextButton(
                      // groupaddtocartBDH (74:24)
                      onPressed: () async {
                        await Method().insertComment('Comment', _comment.text, widget.id);
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        decoration: BoxDecoration (
                          color: const Color(0xff04cf86),
                          borderRadius: BorderRadius.circular(50*fem),
                        ),
                        child: Center(
                          child: Text(
                            'Gửi nhận xét',
                            style: SafeGoogleFont (
                              'Inter',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125*ffem/fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 564, left: 10 ),
                  height: 80,
                  width: 390,
                  child: FutureBuilder<List<NhanXet>>(
                    future: Method().laydulieuComment('Comment', widget.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError || snapshot.data == null) {
                        return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}'));
                      }
                      else if (snapshot.hasData && snapshot.data != null) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, doc) {
                            final  comment = snapshot.data?[doc];
                            final uid = comment?.uid;
                            print(uid);
                            return FutureBuilder(
                              future: Method().fetchUsersFromFirestore(uid!),
                              builder: (context, AsyncSnapshot indexSnapshot) {
                                if (indexSnapshot.connectionState == ConnectionState.waiting) {
                                  return const Center(child: CircularProgressIndicator());
                                }
                                if (!indexSnapshot.hasData || indexSnapshot.data == null || indexSnapshot.data!.isEmpty) {
                                  // Handle the case where no data is available for the given idSP
                                  return Text('Không có dữ liệu cho idSP: $uid');
                                }
                                final List<Users> user = indexSnapshot.data!;
                                final Users merchandise = user.first;
                                return
                                  Container(
                                      child: Container(
                                        child: Card(
                                          child:Container(
                                            color: const Color(0xfffcffeb),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(merchandise!.displayName, style: const TextStyle(fontSize: 15,color: Color(0xff288463)),),
                                                const SizedBox(height: 4,),
                                                Text(comment!.comment,style: const TextStyle(fontSize: 14),),
                                              ],
                                            ),
                                          )
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
