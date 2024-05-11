class YeuThich{
  String id;
  String idCate;
  String uid;

  YeuThich(this.id, this.idCate, this.uid);

  @override
  String toString() {
    return 'YeuThich{id: $id, idCate: $idCate, uid: $uid}';
  }
  Map<String, dynamic> toJson(){
    return {
      "_id": id,
      "idCate": idCate,
      "uid": uid,
    };
  }
}