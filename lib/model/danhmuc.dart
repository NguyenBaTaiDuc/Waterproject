import 'dart:convert';
import 'dart:typed_data';

class DanhMuc{
  String id;
  String Loaisanpham;
  Uint8List? hinhAnh;

  DanhMuc(this.id, this.Loaisanpham);

  @override
  String toString() {
    return 'DanhMuc{id: $id, Loaisanpham: $Loaisanpham}';
  }
  DanhMuc.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        Loaisanpham = json['Loaisanpham']?? '',
        hinhAnh = json['hinhAnh'] != null ? base64Decode(json['hinhAnh']) : null;
}