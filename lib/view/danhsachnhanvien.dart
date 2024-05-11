import 'package:flutter/material.dart';
import 'package:myapp/model/nhanvien.dart';
import 'package:myapp/view/admin.dart';
import 'package:myapp/view/chitietnhanvien.dart';
import 'package:myapp/view/suanhanvien.dart';
import 'package:myapp/view/themnhanvien.dart';

import '../method/function.dart';
import 'confirmdeleteNV.dart';

class DanhSachNhanVien extends StatefulWidget {
  DanhSachNhanVien({super.key});

  @override
  State<StatefulWidget> createState() => _DanhSachNhanVien();
}

class _DanhSachNhanVien extends State<DanhSachNhanVien> {
  final TextEditingController searchNV = TextEditingController();
  String searchKey = '';
  void onDeleteSuccess() {
    // Thực hiện các thao tác cần thiết sau khi xóa sản phẩm thành công
    // Ví dụ: Load lại danh sách sản phẩm
    setState(()  {
      _getProducts();
    });
  }
  List<NhanVien> filteredProducts = [];
  late Future<List<NhanVien>> _futureNV;

  // Phương thức để lọc sản phẩm dựa trên danh mục được chọn
  Future<void> _getProducts() async {
    List<NhanVien> productsData = await Method.laydulieuNV("NhanVien");
      filteredProducts = productsData;
    // Sắp xếp danh sách sản phẩm nếu cần thiết
    setState(() {
      _futureNV = Future.value(filteredProducts);
    });
  }
  void searchProduct(String keyword) {
    setState(() {
      searchKey = keyword;
      if (keyword.isEmpty) {
        // Nếu từ khóa tìm kiếm trống, hiển thị tất cả sản phẩm
        _futureNV = Method.laydulieuNV("NhanVien");
      } else {
        // Nếu có từ khóa tìm kiếm, lọc danh sách sản phẩm theo từ khóa
        _futureNV = Method.laydulieuNV("NhanVien").then((productsData) {
          return productsData.where((product) =>
              normalizeString(product.tenNV).contains(normalizeString(keyword)))
              .toList();
        });
      }
    });
  }
  String normalizeString(String input) {
    return input.toLowerCase(); // Chuyển hết sang chữ thường
  }
  @override
  void initState() {
    super.initState();
    _futureNV= Method.laydulieuNV("NhanVien");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Container(
          width: 412,
          height: 1000,
          decoration: const BoxDecoration(
            color: Color(0xfffcffec),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                width: 412,
                top: 0,
                height: 195,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      width: 412,
                      top: 0,
                      height: 180,
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
                      left: 90,
                      width: 245,
                      top: 65,
                      height: 30,
                      child: Text(
                        'Danh sách nhân viên',
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
                      top: 115,
                      height: 40,
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            searchKey = value;
                          });
                          searchProduct(value);
                        },
                        controller: searchNV,
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

              // khung listview
              Positioned(
                left: 25,
                width: 360,
                top: 235,
                height: 677,
                child: Container(
                  width: 360,
                  height: 677,
                  decoration: const BoxDecoration(
                    color: Color(0xffffffff),
                    border: Border(
                      top: BorderSide(color: Color(0xff02b273), width: 4),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f02b273),
                        offset: Offset(0, -4), // đổ bóng lên trái và lên trên
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
              ),


              Container(
                margin: const EdgeInsets.only(top: 255,left: 35),
                width: 330,
                height: 590,
                child: FutureBuilder<List<NhanVien>>(
                  future: _futureNV,
                  builder: (context,AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError || snapshot.data == null) {
                      return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}')); // Hiển thị khi có lỗi xảy ra
                    } else if (snapshot.hasData && snapshot.data != null) {
                      // print(Method.laydulieuSP("SanPham"));
                      print('Number of items: ${snapshot.data.length}');
                      // Hiển thị ListView khi dữ liệu đã được tải thành công
                      filteredProducts = snapshot.data;
                      return
                        // Text(" có dữ liệu");
                        ListView.builder(
                          itemCount:  filteredProducts.length,
                          itemBuilder: (context, index) {
                            final product = filteredProducts[index];
                            print(product.id);
                            return
                              Container(
                                margin: const EdgeInsets.only(top:  4),
                                height: 115,
                                width: 130,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.green, width: 1.0), // Đây là border phía trên
                                  ),),

                                child: Card(
                                  child: ListTile(
                                      tileColor: const Color(0xffffffff),
                                      visualDensity: const VisualDensity(vertical: 4),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ThongTinChiTietNV(id: product.id,)),
                                        );
                                      },
                                      leading: Container(
                                        width: 60,
                                        height: 60,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(90),
                                            child: product.hinhAnhNV != null ? Image.memory(product.hinhAnhNV!, fit: BoxFit.cover) : Container()),
                                      ),
                                      title: Container(
                                        margin: const EdgeInsets.only(top: 10, bottom: 6),
                                        child: Text( product.tenNV  , style: const TextStyle(
                                          fontFamily: 'TimesNewRoman',
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff028053),
                                        ),),
                                      ),
                                      subtitle:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Số điện thoại : " + product.sdtNV, style: const TextStyle(color: Color(0xff02b273)),)
                                        ],
                                      ),
                                      trailing:
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        CapNhatThongTinNhanVien(
                                                          id: product.id,
                                                        )),
                                              );
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(12,0, 0,25),
                                              width: 23,
                                              height: 23,
                                              child: Image.asset("assets/page-1/images/Editbtn.png", fit: BoxFit.cover,),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context){
                                                    return
                                                      ConfirmationDialogNV(collectionName: 'NhanVien', id: product.id, onDeleteSuccess: onDeleteSuccess, nhanVienname: product.tenNV);

                                                  });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                              width: 23,
                                              height: 23,
                                              child: Image.asset("assets/page-1/images/delete.png",fit:  BoxFit.cover,),
                                            ),
                                          )
                                        ],
                                      )


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

              Positioned(
                left: 115,
                width: 184,
                top: 215,
                height: 38,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ThemNhanVien(),
                      ),
                    );
                  },
                  child: SizedBox.expand(
                    child: Container(
                      width: 184,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        border: Border.all(color: const Color(0xff02b273), width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 32,
                            top: 8,
                            child: Text(
                              'Thêm nhân viên mới',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 15,
                                color: Color(0xff02b273),
                                fontFamily: 'Inter-Regular',
                                fontWeight: FontWeight.normal,
                              ),
                              maxLines: 9999,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Positioned(
                            left: 6,
                            width: 24,
                            top: 5,
                            height: 24,
                            child: Image.asset(
                              'assets/page-1/images/containerGroupAddproImageVector_131208.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
