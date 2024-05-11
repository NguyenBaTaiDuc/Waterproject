import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/model/sanpham.dart';
import 'package:myapp/view/danhsachsanphamadmin.dart';

import '../method/function.dart';

class CapNhatSanPham extends StatefulWidget {
 final String id;
  const CapNhatSanPham({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _CapNhatSanPham();
}

class _CapNhatSanPham extends State<CapNhatSanPham> {
  final TextEditingController _tenSanPhamController = TextEditingController();
  final TextEditingController _giaController = TextEditingController();
  final TextEditingController _donViTinhController = TextEditingController();
  final TextEditingController _moTaController = TextEditingController();
  final TextEditingController _loaihController = TextEditingController();
  final TextEditingController _kichThuocController = TextEditingController();

  Uint8List? imageFile;
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      if (mounted) {
        setState(() {
          imageFile = Uint8List.fromList(imageBytes);
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
   _getData();
  }

// hàm học thông tin sản phẩm vào vào form điền thông tin để dễ sửa đổi
  Future<void> _getData() async {
    try {
      final sanPham = await Method.getDataById(widget.id,'SanPham');
      setState(() {
        _tenSanPhamController.text = sanPham.tenSanPham;
        _giaController.text = sanPham.gia.toString();
        _donViTinhController.text = sanPham.donViTinh;
        _moTaController.text = sanPham.moTa;
        _loaihController.text = sanPham.idCate;
        _kichThuocController.text = sanPham.kichThuoc;
        imageFile = sanPham.hinhAnh;
      });
    } catch (e) {
      // Xử lý khi không tìm thấy dữ liệu
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 20), // Điều chỉnh bottom padding theo bàn phím và thêm một khoảng trống bổ sung
        physics: const ClampingScrollPhysics(),
        reverse: true,
        child: Container(
          color: Colors.white,
          child: Container(
            width: 412,
            height: 950,
            decoration: const BoxDecoration(
              color: Color(0xfffcffec),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  width: 426,
                  top: 0,
                  height: 175,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        width: 430,
                        top: 0,
                        height: 165,
                        child: Container(
                          width: 450,
                          height: 175,
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
                        left: 105,
                        width: 230,
                        top: 65,
                        height: 30,
                        child: Text(
                          "Cập nhật sản phẩm",
                          textAlign: TextAlign.left,
                          style: TextStyle(decoration: TextDecoration.none, fontSize: 24, color: Color(0xffffffff), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                          maxLines: 9999,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Positioned(
                        left: 15,
                        width: 30,
                        top: 65,
                        height: 30,
                        child: Image.asset('assets/page-1/images/imageArrowBackRounded_126174.png', width: 30, height: 30,),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                   _pickImage();
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(135, 181, 0, 0),
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [BoxShadow(color: Color(0x3f02b273), offset: Offset(0, 4), blurRadius: 4),],
                    ),
                      child:  imageFile != null
                          ? Image.memory(imageFile!, fit: BoxFit.cover)
                          : const Icon(Icons.camera_alt, size: 50, color: Color(0x3f02b273)),

                  ),
                ),

                Positioned(
                  left: 95,
                  width: 231,
                  top: 880,
                  height: 44,
                  child: Container(
                    width: 241,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(65),
                    ),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () async {
                           double Price =  double.parse( _giaController.text);
                            SanPham update = SanPham(
                                widget.id,
                                _loaihController.text,
                                imageFile,
                                Price,
                                _tenSanPhamController.text,
                                _moTaController.text,
                                _donViTinhController.text,
                                _kichThuocController.text);
                            await Method().updateSanPham('SanPham', update);
                            Navigator.push(context, CupertinoPageRoute( builder: (context) => DanhSachSanPhamadmin()),
                            );
                            // Xử lý khi nhấn vào Container
                          },
                          child: Container(
                            width: 231,
                            height: 44,
                            decoration: BoxDecoration(
                              color: const Color(0xff04cf86),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Center(
                              child: Text(
                                'Cập nhật',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 20,
                                  color: Color(0xffffffff),
                                  fontFamily: 'TimesNewRoman',
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 370, right: 15),
                  child: TextFormField(
                    controller: _tenSanPhamController,
                    decoration: InputDecoration(
                      labelText: 'Tên sản phẩm',
                      labelStyle: const TextStyle(
                        color: Color(0xff288463),
                        fontSize: 20,
                        fontFamily: 'TimesNewRoman',
                        fontWeight: FontWeight.normal,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff288463), // Màu sắc của border
                          width: 10.0, // Độ dày của border
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff07ce88), // Màu sắc của border khi nhấn vào
                          width: 2.0, // Độ dày của border khi nhấn vào
                        ),
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.grey, // Màu sắc của placeholder
                        fontSize: 16, // Kích thước của placeholder
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // Khoảng cách giữa nội dung và border
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 428, right: 15),
                  child: TextFormField(
                    controller: _loaihController,
                    decoration: InputDecoration(
                      labelText: 'Danh mục',
                      labelStyle: const TextStyle(
                        color: Color(0xff288463),
                        fontSize: 20,
                        fontFamily: 'TimesNewRoman',
                        fontWeight: FontWeight.normal,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff288463),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff07ce88),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 497, right: 15),
                  child: TextFormField(
                    controller: _kichThuocController,
                    decoration: InputDecoration(
                      labelText: 'Size',
                      labelStyle: const TextStyle(
                        color: Color(0xff288463),
                        fontSize: 20,
                        fontFamily: 'TimesNewRoman',
                        fontWeight: FontWeight.normal,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff288463),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff07ce88),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 567, right: 15),
                  child: TextFormField(
                    controller: _giaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Giá',
                      labelStyle: const TextStyle(
                        color: Color(0xff288463),
                        fontSize: 20,
                        fontFamily: 'TimesNewRoman',
                        fontWeight: FontWeight.normal,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff288463),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff07ce88),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 637, right: 15),
                  child: TextFormField(
                    controller: _donViTinhController,
                    decoration: InputDecoration(
                      labelText: 'Đơn vị tính',
                      labelStyle: const TextStyle(
                        color: Color(0xff288463),
                        fontSize: 20,
                        fontFamily: 'TimesNewRoman',
                        fontWeight: FontWeight.normal,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff288463),
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Color(0xff07ce88),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 707, left: 20),
                  child: const Text(
                    'Mô tả:',
                    textAlign: TextAlign.left,
                    style: TextStyle(decoration: TextDecoration.none, fontSize: 20, color: Color(0xff288463), fontFamily: 'Inter-Bold', fontWeight: FontWeight.normal),
                    maxLines: 9999,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Positioned(
                  left: 15,
                  width: 381,
                  top: 640,
                  height: 220,
                  child: Container(
                    margin: const EdgeInsets.only(top: 100), // Thêm margin chỉ xuống
                    width: 360,
                    height: 158,
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: const Color(0xff02b273), width: 1),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    child: TextFormField(
                      controller: _moTaController,
                      decoration: InputDecoration(
                        labelText: 'Mô tả',
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

              ],
            ),
          ),
        ),
      ),
    );
  }
}
