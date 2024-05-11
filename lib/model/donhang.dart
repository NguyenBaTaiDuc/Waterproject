class DonHang{
 late String id;
 late  String uid;
 late String idSP;
  late double gia;
  late int soluong;
  late String thoigian;
  late double TongTien;
  late String PhuongThucThanhToan;
  late String diachi;


 DonHang(this.id, this.uid, this.idSP, this.gia, this.soluong, this.thoigian,
     this.TongTien, this.PhuongThucThanhToan, this.diachi);


 @override
 String toString() {
   return 'DonHang{id: $id, uid: $uid, idSP: $idSP, gia: $gia, soluong: $soluong, thoigian: $thoigian, TongTien: $TongTien, PhuongThucThanhToan: $PhuongThucThanhToan, diachi: $diachi}';
 }

 DonHang.fromJson(Map<String, dynamic> json)
     : id=json['_id'],
       uid= json['uid'],
       idSP = json['idSP'],
       soluong = json['Số lượng'],
      thoigian = json['Thời gian'],
       TongTien = json['Tổng tiền'],
       PhuongThucThanhToan = json['Phương thức thanh toán'],
       diachi = json['Địa chỉ'],
       gia = json['giá'];
}