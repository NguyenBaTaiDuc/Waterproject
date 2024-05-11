import 'dart:convert';
import 'dart:typed_data';

class SanPham {
  late String id;
  late String idCate;
  Uint8List? hinhAnh;
  late double gia;
  late String tenSanPham;
  late String moTa;
  late String donViTinh;
  late String kichThuoc;


  SanPham(this.id, this.idCate, this.hinhAnh, this.gia, this.tenSanPham,
      this.moTa, this.donViTinh, this.kichThuoc);

  SanPham.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        gia = json['gia'] != null ? json['gia'].toDouble() : 0.0,
        tenSanPham = json['tenSanPham'] ?? '',
        hinhAnh = json['hinhAnh'] != null ? base64Decode(json['hinhAnh']) : null,
        idCate = json['idCate'] ?? '',
        moTa = json['moTa'] ?? '',
        donViTinh = json['donViTinh'] ?? '',
        kichThuoc = json['kichThuoc'] ?? '';

  Map<String, dynamic> toJson() {
    String? hinhAnhBase64 = hinhAnh != null ? base64Encode(hinhAnh!) : null;
    return {
      "_id": id,
      "tenSanPham": tenSanPham,
      "gia": gia,
      "hinhAnh": hinhAnhBase64,
      "idCate": idCate,
      "moTa": moTa,
      "donViTinh": donViTinh,
      "kichThuoc": kichThuoc,
    };
  }
}
