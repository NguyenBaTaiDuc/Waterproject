import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/capnhatsanpham.dart';

import '../method/function.dart';
import '../model/danhmuc.dart';
import '../model/sanpham.dart';
import 'chitietsanpham.dart';

class DanhMucSanPhamKH extends StatefulWidget {
  const DanhMucSanPhamKH({super.key});

  @override
  State<DanhMucSanPhamKH> createState() => _DanhMucSanPhamKHState();
}

class _DanhMucSanPhamKHState extends State<DanhMucSanPhamKH> {
  List<SanPham> sortedProducts = []; // biến thực hiện chức năng sort
  List<DanhMuc> categoriesData = []; // Khai báo categoriesData
  late Future<List<SanPham>> _futureSanPham;
  List<SanPham> filteredProducts = [];
  String selectedCategoryId = ''; // Khai báo biến để lưu trữ id danh mục được chọn
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
    if (sapXep) {
      sortProductsByName(filteredProducts);
    }
    setState(() {
      _futureSanPham = Future.value(filteredProducts);
    });
  }
  final TextEditingController search = TextEditingController();
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
  String normalizeString(String input) {
    return input.toLowerCase(); // Chuyển hết sang chữ thường
  }
  bool sapXep = true;
  void sortProductsByName(List<SanPham> productList)
  {
    sortedProducts = List.from(productList); // Tạo một bản sao của danh sách sản phẩm
    sortedProducts.sort((a, b) => a.tenSanPham.compareTo(b.tenSanPham)); // Sắp xếp danh sách sản phẩm theo tên
  }


  @override
  void initState() {
    super.initState();
    searchProduct(searchKey);
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
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          // danhmucsanphamtB3 (5:376)
          width: double.infinity,
          decoration: const BoxDecoration (
            color: Color(0xfff5dab1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // autogroupd25pQv5 (Nuf1G9zcm6EPhD28Yvd25P)
                padding: EdgeInsets.fromLTRB(13*fem, 48*fem, 0*fem, 12.5*fem),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // group71jBf (5:499)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 31*fem),
                        width: double.infinity,
                        height: 45*fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // vectoreZX (5:500)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                              width: 45*fem,
                              height: 45*fem,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Image.asset(
                                  'assets/page-1/images/vector.png',
                                  width: 45*fem,
                                  height: 45*fem,
                                ),
                              ),
                            ),
                            Container(
                              // timkiemyLu (5:501)
                              padding: EdgeInsets.fromLTRB(17*fem, 0*fem, 0*fem, 0*fem),
                              height: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(width: 280,height: 50,
                                    child: CupertinoSearchTextField(
                                      decoration: BoxDecoration (
                                        border: Border.all(color: const Color(0xff993300)),
                                        color: const Color(0xffffffff),
                                        borderRadius: BorderRadius.circular(30*fem),
                                      ),
                                      placeholder: 'Tìm kiếm',
                                      //thay đổi trạng thái listview lọc sản phẩm khi search
                                      onChanged: (value){
                                        setState(() {
                                          searchKey = value;
                                        });
                                        searchProduct(value);
                                      },
                                      // chuyển kiểu chữ để nhận dạng sản phẩm
                                      // onSubmitted: (value){
                                      //   searchValue();
                                      // },
                                      controller: search,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // frame36Q4q (5:388)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 17.5*fem),
                        width: 613*fem,
                        height: 32*fem,
                        decoration: BoxDecoration (
                          color: const Color(0xfffcf2d9),
                          borderRadius: BorderRadius.circular(30.0),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xfff5dab1),
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
                                                      style: TextStyle(fontSize: 16.0, color:isTapped[index] ? Colors.white : Colors.green), // Adjust font size as needed
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
                      Container(
                        // autogrouptybbNDw (NuevXdDPScUQ6TNmmXTYBb)
                          margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 2*fem, 0*fem),
                          width: double.infinity,
                          height: 25*fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    sapXep = !sapXep;// Đảo ngược trạng thái sắp xếp
                                    sortProductsByName(filteredProducts);
                                    // Nếu đang ở trạng thái giảm dần, đảo ngược lại danh sách
                                    if (!sapXep) {
                                      sortedProducts = sortedProducts.reversed.toList();
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      // btsapxep4FB (5:377)
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 18 * fem, 4 * fem),
                                      width: 20 * fem,
                                      height: 20 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/btsapxep.png',
                                        width: 20 * fem,
                                        height: 20 * fem,
                                      ),
                                    ),
                                    Text(
                                      // txspxpmvH (5:402)
                                      'Sắp xếp',
                                      style: SafeGoogleFont(
                                        'Quicksand',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w700,
                                        height: 1.25 * ffem / fem,
                                        color: const Color(0xff993300),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(

                child: FutureBuilder<List<SanPham>>(
                  future: _futureSanPham,
                  builder: (context,AsyncSnapshot snapshot) {
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
                            return
                              SizedBox(
                                height: 130,
                                child: Card(
                                  child: ListTile(
                                    tileColor: Color(0xfff5dab2),
                                    visualDensity: VisualDensity(vertical: 4),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChiTietSanPham()),
                                      );
                                    },
                                    leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: product.hinhAnh != null ? Image.memory(product.hinhAnh!, fit: BoxFit.cover) : Container()),
                                    title: Text( product.tenSanPham  , style: const TextStyle(
                                        fontFamily: 'Quicksand',
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                    ),),
                                    subtitle: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Size : " + product.kichThuoc),
                                      ],
                                    ),
                                    trailing: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        TextButton(
                                         onPressed: () {
                                            // Navigator.push(context,
                                            //   CupertinoPageRoute(
                                            //     builder: (context) =>
                                            //         CapNhatSanPham()
                                            //   ),
                                            // );
                                          },
                                          child: Container(
                                            // bteditbTw (5:459)
                                            margin: EdgeInsets
                                                .fromLTRB(0 * fem, 0 *
                                                fem, 0 * fem, 8 *
                                                fem),
                                            width: 18 * fem,
                                            height: 20 * fem,
                                            child: Image.asset(
                                              'assets/page-1/images/btedit-XD3.png',
                                              width:  22 * fem,
                                              height: 22 * fem,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          // btxoaWL1 (5:462)
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem,
                                              0 * fem, 0 * fem),
                                          width: 40*fem,
                                          height: 35*fem,
                                          child: TextButton(
                                            onPressed: () {
                                            },
                                            child: Image.asset(
                                              'assets/page-1/images/btxoa.png',
                                              width: 17*fem,
                                              height: 20*fem,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}