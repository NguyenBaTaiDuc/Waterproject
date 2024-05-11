import 'package:flutter/material.dart';

import '../method/function.dart';
import '../model/donhang.dart';
import '../model/sanpham.dart';
import 'admin.dart';

class DanhSachDonHangAdmin extends StatefulWidget {
  DanhSachDonHangAdmin({super.key});

  @override
  State<StatefulWidget> createState() => _DanhSachDonHangAdmin();
}

class _DanhSachDonHangAdmin extends State<DanhSachDonHangAdmin> {
  final TextEditingController searchDH = TextEditingController();
  List<DonHang> sortedDH = []; // biến thực hiện chức năng sort

  String searchKeyDH = '';
  void onDeleteSuccess() {
    // Thực hiện các thao tác cần thiết sau khi xóa sản phẩm thành công
    // Ví dụ: Load lại danh sách sản phẩm
    setState(()  {
      _getProducts();
    });
  }
  List<DonHang> filteredProducts = [];
  late Future<List<DonHang>> _futureDH;

  // Phương thức để lọc sản phẩm dựa trên danh mục được chọn
  Future<void> _getProducts() async {
    List<DonHang> productsData = await Method().laydulieuBilladmin("Bill");
    filteredProducts = productsData;
    // Sắp xếp danh sách sản phẩm nếu cần thiết
    setState(() {
      _futureDH = Future.value(filteredProducts);
    });
  }
  void searchProduct(String keyword) {
    setState(() {
      searchKeyDH = keyword;
      if (keyword.isEmpty) {
        // Nếu từ khóa tìm kiếm trống, hiển thị tất cả sản phẩm
        _futureDH = Method().laydulieuBilladmin("Bill");
      } else {
        // Nếu có từ khóa tìm kiếm, lọc danh sách sản phẩm theo từ khóa
        _futureDH = Method().laydulieuBilladmin("Bill").then((productsData) {
          return productsData.where((product) =>
              normalizeString(product.thoigian).contains(normalizeString(keyword)))
              .toList();
        });
      }
    });
  }
  void sortProductSP(bool ascending) {
    setState(() {
      // Sắp xếp danh sách sản phẩm theo tên sản phẩm (có thể thay đổi theo yêu cầu của bạn)
      sortedDH.sort((a, b) => a.thoigian.compareTo(b.thoigian));
      // Nếu cần sắp xếp theo thứ tự giảm dần, đảo ngược danh sách
      if (!ascending) {
        sortedDH = sortedDH.reversed.toList();
      }
      // Cập nhật _futureSanPham với danh sách đã sắp xếp
      _futureDH = Future.value(sortedDH);
    });
  }
  String normalizeString(String input) {
    return input.toLowerCase(); // Chuyển hết sang chữ thường
  }
  @override
  void initState() {
    super.initState();
    _futureDH = Method().laydulieuBilladmin("Bill").then((value) {
      setState(() {
        sortedDH = value;
      });
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                height: 202,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      width: 412,
                      top: 0,
                      height: 202,
                      child: Container(
                        width: 390,
                        height: 202,
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
                      left: 93,
                      width: 245,
                      top: 65,
                      height: 30,
                      child: Text(
                        'Danh sách đơn hàng',
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
                                  const TrangChuAdmin()),
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

                    Positioned(
                      left: 47,
                      width: 316,
                      top: 135,
                      height: 40,
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            searchKeyDH = value;
                          });
                          searchProduct(value);
                        },
                        controller: searchDH,
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm',
                          hintStyle: const TextStyle(fontSize: 20, color: Color(0xff04cf86)),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10), // Điều chỉnh khoảng cách giữa nội dung và viền của TextFormField
                          suffixIcon: Container(
                            margin: const EdgeInsets.only(right: 0), // Điều chỉnh khoảng cách với phần tử khác
                            child: Image.asset(
                              'assets/page-1/images/imageGroupIcsearch_126180.png',
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 25,
                width: 360,
                top: 248,
                height: 677,
                child: Container(
                  width: 360,
                  height: 677,
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    border: Border.all(color: const Color(0xff02b273), width: 1),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 300,left: 30),
                width: 350,
                height: 600,
                child: FutureBuilder<List<DonHang>>(
                  future: _futureDH,
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
                                            margin: const EdgeInsets.only(top: 10),
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
              ),
              Positioned(
                left: 111,
                width: 184,
                top: 229,
                height: 38,
                child: Container(
                  width: 184,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        width: 184,
                        top: 0,
                        height: 38,
                        child: Container(
                          width: 184,
                          height: 38,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            border: Border.all(color: const Color(0xff02b273), width: 2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 56,
                        top: 10,
                        child: Text(
                          'Đơn hàng',
                          textAlign: TextAlign.left,
                          style: TextStyle(decoration: TextDecoration.none, fontSize: 15, color: Color(0xff02b273), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                          maxLines: 9999,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 335,
                width: 22,
                top: 267,
                height: 15,
                child: Image.asset('assets/page-1/images/imageVector_131211.png', width: 22, height: 15,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
