import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/model/nhanvien.dart';
import 'package:myapp/view/danhsachnhanvien.dart';

import '../method/function.dart';
class ThemNhanVien extends StatefulWidget {
  ThemNhanVien({super.key});

  @override
  State<StatefulWidget> createState() => _ThemNhanVien();
}

class _ThemNhanVien extends State<ThemNhanVien> {
  final TextEditingController _ngaySinhNVController = TextEditingController();
  final TextEditingController _tenNVController = TextEditingController();
  final TextEditingController _sdtNVController = TextEditingController();
  final TextEditingController _gmailNVController = TextEditingController();
 Uint8List? hinhAnhNV;

  // hàm chọn và thay thế hình ảnh
  Future<void> _pickImageNV() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      setState(() {
        hinhAnhNV = Uint8List.fromList(imageBytes);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Container(
          width: 390,
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
                height: 155,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      width: 412,
                      top: 0,
                      height: 155,
                      child: Container(
                        width: 412,
                        height: 155,
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
                      width: 240,
                      top: 65,
                      height: 30,
                      child: Text(
                        'Thêm mới nhân viên',
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
                  controller: _tenNVController,
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
                    hintText: 'Nhập tên', // Placeholder
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
                  controller: _ngaySinhNVController,
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
                        _ngaySinhNVController.text = pickedDate.toString(); // Cập nhật giá trị vào controller
                      });
                    }
                  },
                  keyboardType: TextInputType.datetime,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 490, right: 15),
                child: TextFormField(
                  controller: _sdtNVController,
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
                  controller: _gmailNVController,
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
                top: 660,
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
                          // Xử lý khi nhấn vào Container
                          String id = Method().generateId();
                          NhanVien nv = NhanVien(
                              id,
                              _tenNVController.text,
                              _sdtNVController.text,
                              _ngaySinhNVController.text,
                              _gmailNVController.text,
                              hinhAnhNV);
                          await Method().insertDataNV('NhanVien', nv);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DanhSachNhanVien()),
                          );
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
                              'Thêm nhân viên mới ',
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
               onTap: (){
                 _pickImageNV();
               },
               child: Container(
                 margin: const EdgeInsets.fromLTRB(140, 210, 0, 0),
                 width: 120,
                 height: 120,
                 child: hinhAnhNV!=null? Image.memory(hinhAnhNV!, fit: BoxFit.cover,)
                 :  Image.asset('assets/page-1/images/avt 1.png'),
               ),
             )
            ],
          ),
        ),
      ),
    );
  }
}
