import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/model/nhanvien.dart';

import '../method/function.dart';
import 'danhsachnhanvien.dart';
class CapNhatThongTinNhanVien extends StatefulWidget {
  final String id;
  CapNhatThongTinNhanVien({super.key, required this.id});

  @override
  State<StatefulWidget> createState() => _CapNhatThongTinNhanVien();
}

class _CapNhatThongTinNhanVien extends State<CapNhatThongTinNhanVien> {
  final TextEditingController _UpdatengaySinhController = TextEditingController();
  final TextEditingController _UpdatetenNVSinhController = TextEditingController();
  final TextEditingController _UpdatesdtController = TextEditingController();
  final TextEditingController _UpdategmailController = TextEditingController();
  Uint8List? imageFileNV;
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      if (mounted) {
        setState(() {
          imageFileNV = Uint8List.fromList(imageBytes);
        });
      }
    }
  }
  // hàm lấy thông tin sản phẩm đưa vào form dưa dữ liệu
  Future<void> _getDataNV() async {
    try {
      final nhanvien = await Method.getDataByIdNV(widget.id,'NhanVien');
      print(widget.id);
      setState(() {
       _UpdatengaySinhController.text = nhanvien.ngaysinh;
       _UpdategmailController.text = nhanvien.gmail;
       _UpdatesdtController.text = nhanvien.sdtNV;
       _UpdatetenNVSinhController.text = nhanvien.tenNV;
       imageFileNV = nhanvien.hinhAnhNV;
      });
    } catch (e) {
      // Xử lý khi không tìm thấy dữ liệu
      print('Error: $e');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataNV();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom +46),
        physics: const ClampingScrollPhysics(),
        reverse: true,
        child: Container(
          color: Colors.white,
          child: Container(
            width: 412,
            height: 888,
            decoration: const BoxDecoration(
              color: Color(0xfffcffec),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  width: 412,
                  top: 0,
                  height: 215,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        width: 412,
                        top: 0,
                        height: 175,
                        child: Container(
                          width: 390,
                          height: 195,
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
                        left: 95,
                        width: 219,
                        top: 65,
                        height: 58,
                        child: Text(
                          'Cập nhật thông tin nhân viên',
                          textAlign: TextAlign.center,
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
                                    DanhSachNhanVien()),
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
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 370, right: 15),
                  child: TextFormField(
                    controller: _UpdatetenNVSinhController,
                    decoration: InputDecoration(
                      labelText: 'Tên nhân viên',
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
                  padding: const EdgeInsets.only(left: 15, top: 430, right: 15),
                  child: TextFormField(
                    controller: _UpdatengaySinhController,
                    decoration: InputDecoration(
                      labelText: 'Ngày sinh (dd/MM/yyyy)',
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
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          _UpdatengaySinhController.text = pickedDate.toString(); // Cập nhật giá trị vào controller
                        });
                      }
                    },
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 490, right: 15),
                  child: TextFormField(
                    controller: _UpdatesdtController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Số điện thoại',
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
                  padding: const EdgeInsets.only(left: 15, top: 552, right: 15),
                  child: TextFormField(
                    controller: _UpdategmailController,
                    decoration: InputDecoration(
                      labelText: 'Nhập Gmail',
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
                      hintText: 'Gmail.com', // Placeholder
                      hintStyle: const TextStyle(
                        color: Colors.grey, // Màu sắc của placeholder
                        fontSize: 16, // Kích thước của placeholder
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0), // Khoảng cách giữa nội dung và border
                    ),
                  ),
                ),

                Positioned(
                  left: 95,
                  width: 231,
                  top: 630,
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
                            NhanVien nv = NhanVien(
                                widget.id,
                                _UpdatetenNVSinhController.text,
                                _UpdatesdtController.text,
                                _UpdatengaySinhController.text,
                                _UpdategmailController.text,
                                imageFileNV);
                            await Method().updateNhanVien('NhanVien', nv);
                            Navigator.push(context, CupertinoPageRoute( builder: (context) => DanhSachNhanVien()),);
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
                                'Cập nhật ',
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

                GestureDetector(
                  onTap: () {
                    _pickImage();
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(135, 181, 0, 0),
                    width: 150,
                    height: 150,
                    child: Container(

                      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                      width: 10,
                      height: 10,
                      child: imageFileNV!= null
                      ? Image.memory(imageFileNV!, fit: BoxFit.cover,)
                      : Image.asset(
                        'assets/page-1/images/avt 1.png',
                        width: 20,
                        height: 60,
                        // fit: BoxFit.cover, // Chế độ fill
                      ),
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
