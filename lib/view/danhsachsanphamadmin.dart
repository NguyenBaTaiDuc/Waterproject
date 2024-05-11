import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/view/admin.dart';
import 'package:myapp/view/chitietsanphamadmin.dart';
import 'package:myapp/view/confirmdeleteSP.dart';
import 'package:myapp/view/themsanpham.dart';

import '../method/function.dart';
import '../model/danhmuc.dart';
import '../model/sanpham.dart';
import 'capnhatsanpham.dart';
import 'chitietsanpham.dart';

class DanhSachSanPhamadmin extends StatefulWidget {
  DanhSachSanPhamadmin({super.key});

  @override
  State<StatefulWidget> createState() => _DanhSachSanPhamadmin();
}

class _DanhSachSanPhamadmin extends State<DanhSachSanPhamadmin> {
  final TextEditingController search = TextEditingController();
  String searchKey = '';
  void onDeleteSuccess() {
    // Thực hiện các thao tác cần thiết sau khi xóa sản phẩm thành công
    // Ví dụ: Load lại danh sách sản phẩm
    setState(()  {
       _getProducts();
    });
  }
  List<SanPham> sortedProducts = []; // biến thực hiện chức năng sort
  String selectedCategoryId = ''; // Khai báo biến để lưu trữ id danh mục được chọn
  List<DanhMuc> categoriesData = []; // Khai báo categoriesData
  List<SanPham> filteredProducts = [];
  bool sapXep = true;
  late Future<List<SanPham>> _futureSanPham;
  void sortProductSP(bool ascending) {
    setState(() {
      // Sắp xếp danh sách sản phẩm theo tên sản phẩm (có thể thay đổi theo yêu cầu của bạn)
      sortedProducts.sort((a, b) => a.tenSanPham.compareTo(b.tenSanPham));
      // Nếu cần sắp xếp theo thứ tự giảm dần, đảo ngược danh sách
      if (!ascending) {
        sortedProducts = sortedProducts.reversed.toList();
      }
      // Cập nhật _futureSanPham với danh sách đã sắp xếp
      _futureSanPham = Future.value(sortedProducts);
    });
  }

  List<bool> isTapped = [];
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

  String selectedIdCate = '';// Thêm trường này để lưu idCate được chọn
  // Phương thức để lọc sản phẩm dựa trên danh mục được chọn
  Future<void> _getProducts() async {
    List<SanPham> productsData = await Method.laydulieuSP("SanPham");
    if (selectedCategoryId.isNotEmpty) {
      filteredProducts = productsData.where((product) => product.idCate == selectedCategoryId).toList();
    } else {
      filteredProducts = productsData;
    }
    // Sắp xếp danh sách sản phẩm nếu cần thiết
    setState(() {
      _futureSanPham = Future.value(filteredProducts);
    });
  }
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
  String normalizeString(String input) {
    return input.toLowerCase(); // Chuyển hết sang chữ thường
  }
  @override
  void initState() {
    super.initState();
    initializeStates(0);
    _futureSanPham = Method.laydulieuSP("SanPham").then((value) {
      setState(() {
        sortedProducts = value;
      });
      return value;
    });
    Method.getDataFromMongoDB("Categories").then((value) {
      setState(() {
        categoriesData = value;
      });
    });
    _futureSanPham = Method.laydulieuSP("SanPham");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Container(
            width: 412,
            height: 993,
            decoration: const BoxDecoration(
              color: Color(0xfffcffec),
            ),
            child: Stack(
              children: [
                Container(
                  // frame36Q4q (5:388)
                  margin: const EdgeInsets.fromLTRB(0, 200, 0, 17.5),
                  width: 613,
                  height: 40,
                  decoration: BoxDecoration (
                    color: const Color(0xfff5dab1),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xfffcffec),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child:  FutureBuilder<List<DanhMuc>>(
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
                                          margin: const EdgeInsets.symmetric(horizontal: 5.0 ), // Adjust horizontal margin for spacing as needed
                                          padding: const EdgeInsets.only(bottom: 2, left: 10, right: 10, top: 2), // Adjust padding as needed
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(400.0 )), // Set border radius for ellipse shape
                                            border: Border.all(color: const Color(0xff04cf86)), // Border color
                                            color: isTapped[index] ? Colors.green : Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0x7f02b273).withOpacity(0.5), // Adjust opacity for softer shadow
                                                offset: const Offset(2.0 , 4.0 ),
                                                blurRadius: 2.0 ,
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            widthFactor: 30,
                                            heightFactor: 10,
                                            child: Text(
                                              ds.Loaisanpham,
                                              style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: isTapped[index] ? Colors.white : Colors.green,), // Adjust font size as needed
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
                Positioned(
                  left: 23,
                  width: 360,
                  top: 300,
                  height: 670,
                  child: Container(
                    width: 360,
                    height: 677,
                    decoration: const BoxDecoration(
                      color: Color(0xfffcffec),
                      border: Border(
                        top: BorderSide(color: Color(0xff02b273), width: 1),
                        left: BorderSide(color: Color(0xff02b273), width: 1),
                        right: BorderSide(color: Color(0xff02b273), width: 1),
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10), // Độ cong của góc trên trái
                        topRight: Radius.circular(10), // Độ cong của góc trên phải
                      ),
                    ),
                  )
                ),
                //đây

                Positioned(
                  left: 113,
                  width: 184,
                  top: 270,
                  height: 38,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        width: 184,
                        top: 0,
                        height: 38,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ThemDuLieu()),
                            );
                          },
                          child: Container(
                            width: 190,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xffffffff),
                              border: Border.all(color: const Color(0xff02b273), width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                width: 25,
                                  height: 25,
                                  child: Image.asset('assets/page-1/images/containerGroupAddproImageVector_131208.png', fit:  BoxFit.cover,)),
                              const SizedBox(width: 4,),
                              const Text("Thêm sản phẩm mới",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff02b273),
                                  fontFamily: 'TimesNewRoman',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 999,
                                overflow: TextOverflow.ellipsis,
                              )
                            ]
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                      sortProductSP(true);
                        // Xử lý khi nhấn vào Container
                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 325, top: 320),
                        width: 25,
                        height: 25,
                        child: Image.asset(
                          'assets/page-1/images/imageVector_131211.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Các widget khác trong Stack nếu có
                  ],
                ),

                Container(
                  margin: const EdgeInsets.only(top: 350,left: 35),
                  width: 330,
                  height: 500,
                  child: FutureBuilder<List<SanPham>>(
                      future: _futureSanPham,
                      builder: (context,AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }
                        if (snapshot.hasError || snapshot.data == null) {
                          return Center(child: Text('Error: ${snapshot.error ?? "Unknown error"}')); // Hiển thị khi có lỗi xảy ra
                        } else if (snapshot.hasData && snapshot.data != null) {
                          // print(Method.laydulieuSP("SanPham"));
                          print('Number of items: ${snapshot.data.length}');
                          for (var product in snapshot.data) {
                            print('Product: ${product.tenSanPham}, Price: ${product.gia}');
                          }
                          sortedProducts = List.from(snapshot.data);
                          // Hiển thị ListView khi dữ liệu đã được tải thành công
                          return
                            // Text(" có dữ liệu");
                            ListView.builder(
                              itemCount:  sortedProducts.length,
                              itemBuilder: (context, index) {
                                final product = sortedProducts[index];
                                print(product.id);
                                return
                                  Container(
                                      margin: const EdgeInsets.only(top:  4),
                                    height: 130,
                                    width: 130,
                                    decoration: const BoxDecoration(
                                    border: Border(
                                    top: BorderSide(color: Colors.green, width: 1.0), // Đây là border phía trên
                                    ),),

                                    child: Card(
                                      child: ListTile(
                                        tileColor: const Color(0xfffcffec),
                                        visualDensity: const VisualDensity(vertical: 4),
                                        onTap: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ThongTinChiTietSanPhamAdmin(id: product.id,)),
                                          );
                                        },
                                        leading: Container(
                                          width: 60,
                                          height: 60,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container()),
                                        ),
                                        title: Container(
                                          margin: const EdgeInsets.only(top: 10, bottom: 6),
                                          child: Text( product.tenSanPham  , style: const TextStyle(
                                              fontFamily: 'TimesNewRoman',
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff028053),
                                          ),),
                                        ),
                                        subtitle:
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Kích thước : " + product.kichThuoc, style: const TextStyle(color: Color(0xff02b273)),)
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
                                                              CapNhatSanPham(
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
                                                              ConfirmationDialogSP(id: product.id,collectionName: 'SanPham', onDeleteSuccess: onDeleteSuccess, productName: product.tenSanPham, );

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
                            )
                          ),
                        ),
                      ),

                      const Positioned(
                        left: 93,
                        width: 245,
                        top: 65,
                        height: 30,
                        child: Text(
                          'Danh sách sản phẩm',
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
                                    TrangChuAdmin()),
                          );
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          margin: const EdgeInsets.only(top: 60),
                          child: Positioned(
                            left: 45,
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
                        left: 52,
                        width: 316,
                        top: 120,
                        height: 40,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
