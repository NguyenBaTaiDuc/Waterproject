import 'dart:convert';
import 'dart:typed_data';
class NhanVien{
  late String id;
  late String tenNV;
  late String sdtNV;
  late String ngaysinh;
  late String gmail;
  Uint8List? hinhAnhNV;


  NhanVien(this.id, this.tenNV, this.sdtNV, this.ngaysinh, this.gmail,
      this.hinhAnhNV);

  @override
  String toString() {
    return 'NhanVien{tenNV: $tenNV, sdtNV: $sdtNV, ngaysinh: $ngaysinh, gmail: $gmail}';
  }

 Map<String, dynamic> toJson(){
    String? hinhAnh = hinhAnhNV!=null ? base64Encode(hinhAnhNV!): null;
    return{
      "_id": id,
      "tenNhanVien": tenNV,
      "soDienThoai": sdtNV,
      "ngaysinh": ngaysinh,
      "Gmail": gmail,
      "hinhAnh": hinhAnh,
    };
 }
 NhanVien.fromJson(Map<String, dynamic> json)
  :id = json['_id'],
   tenNV = json['tenNhanVien'] ?? '',
   sdtNV = json['soDienThoai'] ?? '',
   ngaysinh = json['ngaysinh']?? '' ,
   gmail = json['Gmail'] ?? '',
   hinhAnhNV = json['hinhAnh'] != null ? base64Decode(json['hinhAnh']) : null;
}
