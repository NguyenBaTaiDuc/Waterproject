class Cart{
  late String id;
  late String uid;
  late String idSP;
  late int soluong;
  late double gia;
  Cart(this.id, this.uid, this.idSP, this.soluong, this.gia);
  Cart.tongtien({required this.soluong, required this.gia, required this.idSP});
  @override
  String toString() {
    return 'Cart{id: $id, uid: $uid, idSP: $idSP, soluong: $soluong, gia: $gia}';
  }
  Map<String, dynamic> toJson(){
    return{
      "_id": id,
      "uid": uid,
      "idSP": idSP,
      "soluong": soluong,
      "gia": gia,
    };
  }
  Cart.fromJson(Map<String, dynamic> json)
  : id=json['_id'],
  uid= json['uid'],
  idSP = json['idSP'],
  soluong = json['soluong'],
  gia = json['gia'];
}