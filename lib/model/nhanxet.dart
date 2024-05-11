class NhanXet{
 late String id;
 late String comment;
 late String uid;
 late String idSP;

 NhanXet(this.id, this.comment, this.uid, this.idSP);

 @override
  String toString() {
    return 'NhanXet{id: $id, comment: $comment, uid: $uid, idSP: $idSP}';
 }
 NhanXet.FromJson(Map<String,dynamic> json)
  : id = json['_id'],
 comment = json['comment']?? '',
 uid = json['uid']?? '',
 idSP = json['idSP'];
}