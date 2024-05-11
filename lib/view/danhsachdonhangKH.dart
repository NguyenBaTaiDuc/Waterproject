import 'package:flutter/material.dart';
import 'package:myapp/model/donhang.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/homepage.dart';

import '../method/function.dart';
import '../model/sanpham.dart';
class DanhSachDonHangKH extends StatefulWidget {
  const DanhSachDonHangKH({super.key});

  @override
  State<DanhSachDonHangKH> createState() => _DanhSachDonHangKHState();
}

class _DanhSachDonHangKHState extends State<DanhSachDonHangKH> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // orderzdu (76:486)
        padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 100*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xfffcffeb),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // groupheaderi47 (74:332)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
              padding: EdgeInsets.fromLTRB(15*fem, 0*fem, 15*fem, 0*fem),
              width: double.infinity,
              height: 170,
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
                    // autogroup1d2o3kb (KPQob7DLJo3WV3WsV11D2o)
                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 10*fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // arrowbackroundedZiw (74:441)
                          margin: EdgeInsets.fromLTRB(0*fem, 45 *fem, 230*fem, 0*fem),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom (
                              padding: EdgeInsets.zero,
                            ),
                            child: SizedBox(
                              width: 40*fem,
                              height: 40*fem,
                              child: Image.asset(
                                'assets/page-1/images/arrow-back-rounded-HmZ.png',
                                width: 30*fem,
                                height: 30*fem,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 45,left: 5),
                          child: TextButton(
                            // homerCF (74:443)
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
                            child: SizedBox(
                              width: 30*fem,
                              height: 30*fem,
                              child: Image.asset(
                                'assets/page-1/images/home-BuZ.png',
                                width: 30*fem,
                                height: 30*fem,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    // danhschnhngAij (74:374)
                    margin: EdgeInsets.fromLTRB(3*fem, 10*fem, 0*fem, 0*fem),
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Danh sách đơn hàng',
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 24*ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125*ffem/fem,
                        color: const Color(0xffffffff),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 400,
              height: 550,
              child: FutureBuilder<List<DonHang>>(
                future: Method().laydulieuBill('Bill'),
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
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        final idSP = product.idSP;
                        int sl = product.soluong;
                        var gia = product.gia;
                        final ngay = product.thoigian;

                        return FutureBuilder<List<SanPham>>(
                          future: Method.laydulieuSPchoBill(idSP),
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
                                        leading: SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(40),
                                            child: merchandise.hinhAnh != null ? Image.memory(merchandise.hinhAnh!, fit: BoxFit.cover) : Container(),
                                          ),
                                        ),
                                        title: Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text(
                                           ngay,
                                            style: const TextStyle(
                                              fontFamily: 'TimesNewRoman',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff028053),
                                            ),
                                          ),
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              merchandise.tenSanPham,
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'TimesNewRoman',
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff028053),
                                              ),
                                            ),
                                            Text("$gia VNĐ", style: const TextStyle(color: Color(0xff02b273)),),
                                            Text( "Sô lượng: " + sl.toString(), style: const TextStyle(color: Color(0xff02b273)),)
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
            )
          ],
        ),
      ),
    );
  }
}
