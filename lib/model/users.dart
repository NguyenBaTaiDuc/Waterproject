import 'package:cloud_firestore/cloud_firestore.dart';

class Users{
 final String displayName;
 final String email;
 final String gioitinh;
 final String matKhau;
 final String ngaysinh;
 final String sdt;
 final String role;
 final String uid;


 Users(
      this.displayName,
      this.email,
      this.gioitinh,
      this.matKhau,
      this.ngaysinh,
      this.role,
      this.sdt,
      this.uid); // Hàm tạo từ dữ liệu Firestore
 Users.loginWithEmailPassword(String email, String matKhau)
     : displayName = '', // Gán giá trị mặc định cho các trường khác
      email = email,
      sdt = '', // Gán giá trị mặc định cho các trường khác
      uid = '', // Gán giá trị mặc định cho các trường khác
      gioitinh = '', // Gán giá trị mặc định cho các trường khác
      ngaysinh = '', // Gán giá trị mặc định cho các trường khác
      matKhau = matKhau,
      role = ''; // Gán giá trị mặc định cho các trường khác


 factory Users.fromFirestore(DocumentSnapshot doc) {
  Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  return Users(
   data['displayName'] ?? '',
   data['email'] ?? '',
   data['gioitinh'] ?? '',
   data['matKhau'] ?? '',
   data['ngaysinh'] ?? '',
   data['role'] ?? '',
   data['sdt'] ?? '',
   data['uid'] ?? '',
  );
 }


 @override
  String toString() {
    return 'Users{displayName: $displayName, email: $email, gioitinh: $gioitinh, matKhau: $matKhau, ngaysinh: $ngaysinh, role: $role, sdt: $sdt, uid: $uid}';
  }

  Map<String, dynamic> toMap() {
  return {
   'email': email,
   'displayName': displayName,
   'sdt': sdt,
   'gioitinh': gioitinh,
   'ngaysinh': ngaysinh,
   'uid': uid,
   'matkhau': matKhau,
   'role': role,
  };
 }

}