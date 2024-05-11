import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:myapp/model/danhmuc.dart';
import 'package:myapp/model/donhang.dart';
import 'package:myapp/model/nhanvien.dart';
import 'package:myapp/model/nhanxet.dart';
import 'package:myapp/model/yeuthich.dart';
import 'package:myapp/view/login.dart';
import '../main.dart';
import '../model/giohang.dart';
import '../model/sanpham.dart';
import '../model/users.dart';
import 'firebase_auth.dart';
class Method {
  final FirebaseAuthService _authService = FirebaseAuthService();

  //flutter lYTFQ7Tsju3Glcv5
  // mongodb+srv://Project:z5NNKruQK5qnZ6Gn@cluster0.pydgmcw.mongodb.net/Flutter?retryWrites=true&w=majority&appName=Cluster0//
  static var db, userCollection;

  //UnEmTK5vPoleovFQ
  static const MONGO_URL ="mongodb+srv://taiduc:UnEmTK5vPoleovFQ@cluster0.goeykdi.mongodb.net/flutter?retryWrites=true&w=majority&appName=Cluster0";

  // hàm kết nối với database
  static Future<void> connect(String collectionName) async
  {
    db = await Db.create(MONGO_URL);
    await db.open();
    userCollection = db.collection(collectionName);
    // await db.close();
  }

  // nhấn click vào màn hình để chuyển sang đăng nhập
  void navigateToSecondScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DangNhap()),
    );
  }

  // Hàm thực hiện đăng ký tài khoản
  Future<void> registerWithEmailAndPassword(String email, String password, Users useres) async {
    try {
      User? user = await _authService.signUpWithEmailAndPassword(
          email, password);
      if (user != null) {
        print("User registration successful: ${user.uid}");
      } else {
        print("User registration failed");
      }
    } catch (e) {
      print("An error occurred during registration: $e");
    }
  }


  // hàm đăng nhập
  Future<void> signInWithEmailAndPassword(Users u, BuildContext context) async {
    try {
      User? user = await _authService.signInWithEmailAndPassword(
          u.email, u.matKhau);

      if (user != null) {
        // Đọc thông tin người dùng từ Firestore
        FirebaseFirestore.instance
            .collection('Users')
            .where('uid', isEqualTo: user.uid)
            .get()
            .then((docs) {
          if (docs.docs.isNotEmpty) {
            String role = docs.docs[0]['role'];
            if (role == 'Quản lý') {
              // Đăng nhập với vai trò admin
              Navigator.pushReplacementNamed(context, '/admin_home');
            } else if (role == 'Khách hàng') {
              // Đăng nhập với vai trò nhân viên
              Navigator.pushReplacementNamed(context, '/customer_home');
            }
          } else {
            Fluttertoast.showToast(msg: 'Email hoặc mật khẩu không tồn tại');
            print("User's document not found in Firestore");
          }
          Fluttertoast.showToast(msg: 'Đăng nhập thành công!');
        });
      } else {
        print("Some error happened");
        Fluttertoast.showToast(msg: 'Đăng nhập thất bại!');
        Fluttertoast.showToast(
            msg: 'Mật khẩu hoặc tài khoản không chính xác, vui lòng nhập lại');
      }
    } catch (e) {
      print("Đã xảy ra lỗi khi đăng nhập: $e");
    }
  }

  // đổi mật khẩu
  Future<void> resetPassword(String newPassword) async {
    try {
      // Lấy người dùng hiện tại từ FirebaseAuthService
      User? currentUser = _authService.getCurrentUser();
      if (currentUser != null) {
        String Id = currentUser.uid;
        // Đổi mật khẩu của người dùng
        await currentUser.updatePassword(newPassword);
        await FirebaseFirestore.instance.collection('Users').doc(Id).update(
            {'matkhau': newPassword});
        // Hiển thị thông báo thành công
        print('Mật khẩu đã được thay đổi thành công');
      } else {
        // Người dùng không được tìm thấy
        print('Người dùng không được tìm thấy');
      }
    } catch (e) {
      // Hiển thị thông báo lỗi nếu có
      print("Đã xảy ra lỗi khi thay đổi mật khẩu: $e");
    }
  }

  // đăng nhập bằng tài khoản google
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn();
      final FirebaseAuth _auth = FirebaseAuth.instance;

      // Đăng nhập với Google
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn
          .signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
            .authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Đăng nhập vào Firebase với Google Credential
        final UserCredential userCredential = await _auth.signInWithCredential(
            credential);
        final User? user = userCredential.user;
        if (user != null) {
          // Lưu thông tin người dùng vào Firestore
          await FirebaseFirestore.instance.collection('Users')
              .doc(user.uid)
              .set({
            'uid': user.uid,
            'email': user.email,
            // Các thông tin khác bạn muốn lưu
          });

          // Điều hướng tới màn hình chính sau khi đăng nhập thành công
          Navigator.pushReplacementNamed(context, '/customer_home');
          Fluttertoast.showToast(msg: 'Đăng nhập thành công!');
        } else {
          Fluttertoast.showToast(msg: 'Đăng nhập thất bại!');
          print("Some error happened");
        }
      }
    } catch (e) {
      print("Đã xảy ra lỗi khi đăng nhập bằng Google: $e");
    }
  }


  // tạo ID
  String generateId() {
    // Tạo ID dựa trên thời gian hiện tại, hoặc sử dụng một cách khác tạo ID tùy chọn của bạn
    return DateTime
        .now()
        .millisecondsSinceEpoch
        .toString();
  }

  //hàm  thêm dữ liệu
  Future<String?> insertData(String collectionName, SanPham sanPham) async {
    try {
      await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = db.collection(collectionName);
      var data = sanPham.toJson();
      var result = await collection.insertOne(data);
      if (result.isSuccess) {
        print("Data inserted successfully!");
        Fluttertoast.showToast(msg: "Thêm sản phẩm thành công");
      } else {
        Fluttertoast.showToast(msg: "Thêm sản phẩm thất bại");
        print("Failed to insert data!");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      await db.close();
    }
  }

  //hàm lấy dữ liệu từ bảng Categories trên mongoDB
  static Future<List<DanhMuc>> getDataFromMongoDB(String collectionName) async {
    Db db;
    try {
      db = await Db.create(MONGO_URL);
      await db.open();
      var collection = db.collection(collectionName);
      var snapshot = await collection.find().toList();

      List<DanhMuc> danhmucList = [];
      for (var data in snapshot) {
        danhmucList.add(DanhMuc.fromJson(data as Map<String, dynamic>));
      }
      // print('Number of items in danhmucList: ${danhmucList}');

      return danhmucList;
    } catch (e) {
      return []; // Consider handling the error more informatively
    } finally {}
  }
// lấy dữ liêu sản phẩm đưa lên maàn hình danhsachsanpham
  static Future<List<SanPham>>  laydulieuSP(String collectionName) async {
    Db dbSP;
    try {
      dbSP = await Db.create(MONGO_URL);
      await dbSP.open(); // Mở kết nối đến MongoDB
      // await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = dbSP.collection(collectionName);
      var snapshot = await collection.find().toList();
      List<SanPham> sanphamList = [];
      for (var data in snapshot)
      {
        sanphamList.add(SanPham.fromJson(data as Map<String, dynamic>));
      }
      print('Number of items in sanphamList: ${sanphamList}');

      return sanphamList;
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      // await dbSP.close();
    }
  }

  // hàm lấy dữ liệu sản phẩm thông qua id (được gọi ở bên mành hình update)
  static Future<SanPham> getDataById(String id, String collectionName) async {
    final db = await Db.create(MONGO_URL);
    await db.open();
    final userCollection = db.collection(collectionName);
    final result = await userCollection.findOne(where.eq('_id', id ));
    if (result != null) {
      return SanPham.fromJson(result);
    } else {
      throw Exception('Không tìm thấy sản phẩm với ID: $id');
    }
  }
   // cập nhật dữ liệu vào database
  Future<void> updateSanPham(String collectionName, SanPham sanPham) async {
    try {
      await connect(collectionName);
      var collection = db.collection(collectionName);
      var result = await collection.findOne(where.eq('_id', sanPham.id));
      var updatedFields = {
        'gia': sanPham.gia,
        'tenSanPham': sanPham.tenSanPham,
        'hinhAnh': sanPham.hinhAnh != null ? base64Encode(sanPham.hinhAnh!) : null,
        'idCate': sanPham.idCate,
        'moTa': sanPham.moTa,
        'donViTinh': sanPham.donViTinh,
        'kichThuoc': sanPham.kichThuoc,
      };
      await collection.replaceOne(where.eq('_id', sanPham.id), updatedFields);
      print(result != null ? 'Cập nhật thông tin sản phẩm thành công' : 'Không tìm thấy sản phẩm với ID: ${sanPham.id}');
      Fluttertoast.showToast(msg: result != null ? 'Cập nhật sản phẩm thành công' : 'Cập nhật sản phẩm thất bại');
    } catch (e) {
      print("Error: $e");
      if (e is MongoDartError) {
        print("MongoDB Error: $e");
      }
    }
  }
// hàm thực hiện chức năng xóa sản phẩm
  Future<void> deleteSanPham(String collectionName, String id) async {
    try {
      await connect(collectionName);
      var collection = db.collection(collectionName);
      // Xóa sản phẩm dựa trên ID
      var result = await collection.deleteOne(where.eq('_id', id));
      if (result.deletedCount != null && result.deletedCount! > 0) {
        print('Xóa sản phẩm thành công');

      } else {
        print('Không tìm thấy sản phẩm để xóa với ID: $id');
        Fluttertoast.showToast(msg: "Xóa sản phẩm thất bại");
      }
    } catch (e) {
      // Xử lý các loại ngoại lệ khác
      print("Error: $e");
    }
  }
 // hàm thêm dữ liệu nhân viên
  Future<String?> insertDataNV(String collectionName, NhanVien nhanVien) async {
    try {
      await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = db.collection(collectionName);

      var data = nhanVien.toJson();

      var result = await collection.insertOne(data);

      if (result.isSuccess) {
        print("Data inserted successfully!");
        Fluttertoast.showToast(msg: "Thêm nhân viên thành công");
      } else {
        Fluttertoast.showToast(msg: "Thêm nhân viên thất bại");
        print("Failed to insert data!");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      await db.close();
    }
  }

  // lấy dữ liêu sản phẩm đưa lên maàn hình danhsachnhanvien
  static Future<List<NhanVien>> laydulieuNV(String collectionName) async {
    Db dbSP;
    try {
      dbSP = await Db.create(MONGO_URL);
      await dbSP.open(); // Mở kết nối đến MongoDB
      // await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = dbSP.collection(collectionName);
      var snapshot = await collection.find().toList();

      List<NhanVien> nhanvienList = [];
      for (var data in snapshot) {
        nhanvienList.add(NhanVien.fromJson(data as Map<String, dynamic>));
      }
      print('Number of items in sanphamList: ${nhanvienList}');

      return nhanvienList;
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      // await dbSP.close();
    }
  }

  // hàm lấy dữ liệu nhân viên thông qua id (được gọi ở bên mành hình update)
  static Future<NhanVien> getDataByIdNV(String id, String collectionName) async {
    final db = await Db.create(MONGO_URL);
    await db.open();
    final userCollection = db.collection(collectionName);

    final result = await userCollection.findOne(where.eq('_id', id ));
    if (result != null) {
      return NhanVien.fromJson(result);
    } else {
      throw Exception('Không tìm thấy nhân viên với ID: $id');
    }
  }

  // cập nhật dữ liệu nhân viên vào database
  Future<void> updateNhanVien(String collectionName, NhanVien nhanvien) async {
    try {
      await connect(collectionName);
      var collection = db.collection(collectionName);
      var result = await collection.findOne(where.eq('_id', nhanvien.id));
      var updatedFields = {
        'tenNhanVien': nhanvien.tenNV,
        'soDienThoai': nhanvien.sdtNV,
        'hinhAnh': nhanvien.hinhAnhNV != null ? base64Encode(nhanvien.hinhAnhNV!) : null,
        'Gmail': nhanvien.gmail,
        'ngaysinh': nhanvien.ngaysinh,
      };
      await collection.replaceOne(where.eq('_id', nhanvien.id), updatedFields);
      print(result != null ? 'Cập nhật thông tin nhân viên thành công' : 'Không tìm thấy sản phẩm với ID: ${nhanvien.id}');
      Fluttertoast.showToast(msg: result != null ? 'Cập nhật thông tin nhân viên thành công' : 'Cập nhật thông tin nhân viên thất bại');
    } catch (e) {
      print("Error: $e");
      if (e is MongoDartError) {
        print("MongoDB Error: $e");
      }
    }
  }

  // hàm thực hiện chức năng xóa nhân viên
  Future<void> deleteNhanVien(String collectionName, String id) async {
    try {
      await connect(collectionName);
      var collection = db.collection(collectionName);
      // Xóa sản phẩm dựa trên ID
      var result = await collection.deleteOne(where.eq('_id', id));
      if (result.deletedCount != null && result.deletedCount! > 0) {
        print('Xóa sản phẩm thành công');

      } else {
        print('Không tìm thấy sản phẩm để xóa với ID: $id');
        Fluttertoast.showToast(msg: "Xóa sản phẩm thất bại");
      }
    } catch (e) {
      // Xử lý các loại ngoại lệ khác
      print("Error: $e");
    }
  }

  // hàm thêm sản phẩm vào danh mục yeu thích
  Future<String?> insertDataYeuThich(String collectionName, YeuThich yeuThich) async {
    try {
      await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = db.collection(collectionName);
      var check = await collection.findOne({'_id': yeuThich.id});
      if(check != null){
        print('Sản phẩm đã tồn tại trong danh sách yu thích!');
        Fluttertoast.showToast(msg: "Sản phẩm đã tồn tại trong danh sách yêu thích");
      }

      var data = yeuThich.toJson();

      var result = await collection.insertOne(data);

      if (result.isSuccess) {
        print("Data inserted successfully!");
        Fluttertoast.showToast(msg: "Đã thêm sản phẩm vào danh sách yêu thích");
      } else {
        Fluttertoast.showToast(msg: "Thêm thất bại");
        print("Failed to insert data!");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      await db.close();
    }
  }

  // hàm thực hiện chức năng xóa yêu thích
  Future<void> deleteYeuThich(String collectionName, String id) async {
    try {
      await connect(collectionName);
      var collection = db.collection(collectionName);
      // Xóa sản phẩm dựa trên ID
      var result = await collection.deleteOne(where.eq('_id', id));
      if (result.deletedCount != null && result.deletedCount! > 0) {
        print('Xóa sản phẩm thành công');

      } else {
        print('Không tìm thấy sản phẩm để xóa với ID: $id');
        Fluttertoast.showToast(msg: "Xóa sản phẩm thất bại");
      }
    } catch (e) {
      // Xử lý các loại ngoại lệ khác
      print("Error: $e");
    }
  }
// lấy dữ liệu id của bảng yeu thich
   Future<List<String>> laydulieuIDyeuthich(String collectionName) async {
    Db dbSP;
    User? user =  _authService.getCurrentUser();
    String uid = user!.uid;
    try {
      dbSP = await Db.create(MONGO_URL);
      await dbSP.open(); // Mở kết nối đến MongoDB
      // await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = dbSP.collection(collectionName);
      var snapshot = await collection.find(where.eq('uid', uid)).toList();

      List<String> idList = [];
      for (var data in snapshot) {
        idList.add(data['_id'] as String);
      }
      print('Number of items in yeuthichList: ${idList.length}');
      return idList;
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      // await dbSP.close();
    }
  }
// lấy dữ liệu sản phẩm từ id đưa vào danh mục yêu thích
  Future<List<SanPham>> fetchSanPhamFavorite() async {
    // 1. Lấy danh sách ID sản phẩm từ bảng favorite
    List<String> favoriteIds = await laydulieuIDyeuthich('YeuThich'); // Phương thức này cần được thay thế bằng phương thức thực sự để lấy ID sản phẩm từ MongoDB
    // 2. Dựa vào ID sản phẩm, lấy thông tin sản phẩm từ MongoDB
    List<SanPham> yeuthichList = [];

    List<SanPham> allSanPham = await laydulieuSP('SanPham');
    for (String id in favoriteIds) {
      SanPham? sanPham = allSanPham.firstWhere((sp) => sp.id == id); // Phương thức này cần được thay thế bằng phương thức thực sự để lấy thông tin sản phẩm từ MongoDB
      yeuthichList.add(sanPham);
        }
    return yeuthichList;
  }


  // hàm thêm sản phẩm vào danh mục giỏ hàng
  Future<String?> insertDataCart(String collectionName,Cart cart) async {
    try {
      await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = db.collection(collectionName);

      // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng của người dùng chưa
      var existingCartItem = await collection.findOne({'idSP': cart.idSP});
      if (existingCartItem != null) {
        // Nếu sản phẩm đã tồn tại, tăng số lượng lên một và cập nhật lại tổng tiền
        var updatedQuantity = existingCartItem['soluong'] + cart.soluong;
        var updatedTotalPrice = cart.gia * updatedQuantity;

        // Cập nhật dữ liệu sản phẩm trong giỏ hàng
        var updateResult = await collection.updateOne({'uid': cart.uid, 'idSP': cart.idSP}, {
          r'$set': {'soluong': updatedQuantity, 'gia': updatedTotalPrice}
        });

        if (updateResult.isSuccess) {
          print("Quantity updated successfully!");
          Fluttertoast.showToast(msg: "Số lượng sản phẩm đã được cập nhật");
          return "success";
        } else {
          Fluttertoast.showToast(msg: "Cập nhật số lượng sản phẩm thất bại");
          print("Failed to update quantity!");
          return null;
        }
      } else {
        // Nếu sản phẩm chưa tồn tại, thêm sản phẩm mới vào giỏ hàng
        var data = {
          '_id': cart.id,
          'uid': cart.uid,
          'idSP': cart.idSP,
          'gia': cart.gia,
          'soluong': cart.soluong
        };

        var insertResult = await collection.insertOne(data);

        if (insertResult.isSuccess) {
          print("Data inserted successfully!");
          Fluttertoast.showToast(msg: "Đã thêm sản phẩm vào giỏ hàng");
          return "success";
        } else {
          Fluttertoast.showToast(msg: "Thêm sản phẩm vào giỏ hàng thất bại");
          print("Failed to insert data!");
          return null;
        }
      }
    } catch (e) {
      print("Error: $e");
      return null;
    } finally {
      // await db.close(); // Đóng kết nối
    }
  }
  // lấy dữ liệu id của bảng cart
  Future<List<Cart>> laydulieuCart(String collectionName) async {
    Db dbSP;
    User? user =  _authService.getCurrentUser();
    String uid = user!.uid;
    try {
      dbSP = await Db.create(MONGO_URL);
      await dbSP.open(); // Mở kết nối đến MongoDB
      // await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = dbSP.collection(collectionName);
      var snapshot = await collection.find(where.eq('uid', uid)).toList();

      List<Cart> cartList = [];
      for (var data in snapshot) {
        cartList.add(Cart.fromJson(data as Map<String,dynamic>));
      }
      print('Number of items in cartList: ${cartList}');

      return cartList;
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      // await dbSP.close();
    }
  }

  static Future<List<SanPham>> laydulieuSPchoCart(String id) async {
    Db dbSP;
    try {
      dbSP = await Db.create(MONGO_URL);
      await dbSP.open(); // Mở kết nối đến MongoDB
      var collection = dbSP.collection('SanPham'); // Sử dụng tên bảng cố định 'SanPham'
      var snapshot = await collection.find(where.eq('_id', id)).toList(); // Truy vấn dữ liệu chỉ lấy ra dựa trên _id

      List<SanPham> sanphamList = [];
      for (var data in snapshot) {
        sanphamList.add(SanPham.fromJson(data as Map<String, dynamic>));
      }
      print('Number of items in sanphamList: ${sanphamList.length}');

      return sanphamList;
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      // await dbSP.close();
    }
  }

//   // Hàm cập nhật một mục trong bảng cart
  Future<void> updateCart(String collectionName, Cart cart) async {
    try {
      await connect(collectionName);
      var collection = db.collection(collectionName);
      var result = await collection.findOne(where.eq('idSP', cart.idSP));
      var updatedFields = {
        'soluong': cart.soluong,
        'gia': cart.gia,
        'uid': cart.uid,
        'idSP': cart.idSP,
        '_id':cart.id,
      };
      await collection.replaceOne(where.eq('idSP', cart.idSP), updatedFields);
      print(result != null ? 'Cập nhật thông tin nhân viên thành công' : 'Không tìm thấy sản phẩm với ID: ${cart.id}');
      Fluttertoast.showToast(msg: result != null ? 'Cập nhật thông tin cart thành công' : 'Cập nhật thông tin cart thất bại');
    } catch (e) {
      print("Error: $e");
      if (e is MongoDartError) {
        print("MongoDB Error: $e");
      }
    }
  }

  //BUILD TRANG MENUKHACHHANG

// Hàm để lấy dữ liệu sản phẩm dựa trên idCate (Cà phê)
  static Future<List<SanPham>> getDataByIdCateSPCF(String collectionName) async {
    final String idCate = "Cà phê"; // Đây có thể là một giá trị cố định hoặc có thể được lấy từ một nguồn khác
    final db = await Db.create(MONGO_URL);
    await db.open();
    final userCollection = db.collection(collectionName);

    final List<Map<String, dynamic>> results = await userCollection.find(where.eq('idCate', idCate)).toList();
    final List<SanPham> sanPhams = results.map((map) => SanPham.fromJson(map)).toList();

    return sanPhams;
  }
// Hàm để lấy dữ liệu sản phẩm dựa trên idCate (Nước)

  static Future<List<SanPham>> getDataByIdCateSPNuoc(String collectionName) async {
    final String idCate = "Nước"; // Đây có thể là một giá trị cố định hoặc có thể được lấy từ một nguồn khác
    final db = await Db.create(MONGO_URL);
    await db.open();
    final userCollection = db.collection(collectionName);

    final List<Map<String, dynamic>> results = await userCollection.find(where.eq('idCate', idCate)).toList();
    final List<SanPham> sanPhams = results.map((map) => SanPham.fromJson(map)).toList();

    return sanPhams;
  }

  // Hàm để lấy dữ liệu sản phẩm dựa trên idCate (Sinh tố)

  static Future<List<SanPham>> getDataByIdCateSPSinhTo(String collectionName) async {
    final String idCate = "Sinh tố"; // Đây có thể là một giá trị cố định hoặc có thể được lấy từ một nguồn khác
    final db = await Db.create(MONGO_URL);
    await db.open();
    final userCollection = db.collection(collectionName);

    final List<Map<String, dynamic>> results = await userCollection.find(where.eq('idCate', idCate)).toList();
    final List<SanPham> sanPhams = results.map((map) => SanPham.fromJson(map)).toList();

    return sanPhams;
  }

  // Hàm để lấy dữ liệu sản phẩm dựa trên idCate (Soda)

  static Future<List<SanPham>> getDataByIdCateSPSoda(String collectionName) async {
    final String idCate = "Soda"; // Đây có thể là một giá trị cố định hoặc có thể được lấy từ một nguồn khác
    final db = await Db.create(MONGO_URL);
    await db.open();
    final userCollection = db.collection(collectionName);

    final List<Map<String, dynamic>> results = await userCollection.find(where.eq('idCate', idCate)).toList();
    final List<SanPham> sanPhams = results.map((map) => SanPham.fromJson(map)).toList();

    return sanPhams;
  }

  Future<double> calculateTotalPrice(String collectionName) async {
    User? user =  _authService.getCurrentUser();
    String uid = user!.uid;
    try {
      await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = db.collection(collectionName);

      var snapshot = await collection.find(where.eq('uid', uid)).toList();
      double totalPrice = 0.0;

      for (var item in snapshot) {
        totalPrice += (item['gia'] as num).toDouble();
      }

      return totalPrice;
    } catch (e) {
      print("Error: $e");
      return 0.0;
    } finally {
      await db.close(); // Đóng kết nối
    }
  }
  // Hàm chuyển tất cả ữ liệu từ bảng cart sang bảng bill
  Future<void> moveDataFromCartToBill(String cartCollectionName, String billCollectionName, double tongtien,String phuongthuc, String diachi, String trangThai) async {
    User? user =  _authService.getCurrentUser();
    String uid = user!.uid;
    try {
      await connect(cartCollectionName); // Mở kết nối đến bảng Cart
      var cartCollection = db.collection(cartCollectionName);

      // Lấy tất cả dữ liệu từ bảng Cart
      var cartData = await cartCollection.find().toList();

      // Kiểm tra nếu có dữ liệu trong bảng Cart
      if (cartData.isNotEmpty) {
        // Mở kết nối đến bảng Bill
        await connect(billCollectionName);
        var billCollection = db.collection(billCollectionName);

        // Lặp qua từng dòng dữ liệu trong bảng Cart và chuyển sang bảng Bill
        for (var item in cartData) {
          // Lấy thời gian hiện tại
          var currentTime = DateFormat('yyyy-MM-dd HH-mm-ss').format(DateTime.now());
          // Tạo một đối tượng Bill từ dữ liệu trong Cart
          var billData = {
            '_id': item['_id'], // Giữ nguyên ID
            'uid': item['uid'],
            'idSP': item['idSP'],
            'giá': item['gia'],
            'Số lượng': item['soluong'],
            'Thời gian': currentTime,
            'Tổng tiền': tongtien,
            'Phương thức thanh toán': phuongthuc,
            'Địa chỉ': diachi,
            'Trạng thái': trangThai,
            // Các trường dữ liệu khác bạn muốn chuyển sang Bill
          };

          // Chèn dữ liệu vào bảng Bill
          var insertResult = await billCollection.insertOne(billData);

          if (insertResult.isSuccess) {
            print("Data inserted into Bill successfully!");
          } else {
            print("Failed to insert data into Bill!");
          }
        }

        // Xóa tất cả dữ liệu từ bảng Cart sau khi đã chuyển sang bảng Bill
        var deleteResult = await cartCollection.deleteMany({});

        if (deleteResult.isSuccess) {
          print("All data moved from Cart to Bill successfully!");
        } else {
          print("Failed to delete data from Cart!");
        }
      } else {
        print("No data found in Cart!");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      // await db.close(); // Đóng kết nối
    }
  }
// hàm lấy dữ liệu bảng Bill
   Future<List<DonHang>> laydulieuBill(String collectionName) async {
    Db dbSP;
    User? user =  _authService.getCurrentUser();
    String uid = user!.uid;
    try {
      dbSP = await Db.create(MONGO_URL);
      await dbSP.open(); // Mở kết nối đến MongoDB
      var collection = dbSP.collection(collectionName);
      var snapshot = await collection.find(where.eq('uid', uid)).toList();

      List<DonHang> billList = [];
      for (var data in snapshot) {
        billList.add(DonHang.fromJson(data));
      }
      print('Number of items in billList: ${billList.length}');

      return billList;
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      // Đóng kết nối đến cơ sở dữ liệu sau khi hoàn thành
      // await dbSP.close();
    }
  }

  Future<void> deleteDonHang(String collectionName, String id) async {
    try {
      await connect(collectionName);
      var collection = db.collection(collectionName);
      // Xóa sản phẩm dựa trên ID
      var result = await collection.deleteOne(where.eq('_id', id));
      if (result.deletedCount != null && result.deletedCount! > 0) {
        print('Xóa sản phẩm thành công');
        Fluttertoast.showToast(msg: "Đã xóa sản phẩm khỏi giỏ hàng");

      } else {
        print('Không tìm thấy sản phẩm để xóa với ID: $id');
        Fluttertoast.showToast(msg: "Xóa sản phẩm thất bại");
      }
    } catch (e) {
      // Xử lý các loại ngoại lệ khác
      print("Error: $e");
    }
  }

  static Future<List<SanPham>> laydulieuSPchoBill(String id) async {
    Db dbSP;
    try {
      dbSP = await Db.create(MONGO_URL);
      await dbSP.open(); // Mở kết nối đến MongoDB
      var collection = dbSP.collection('SanPham'); // Sử dụng tên bảng cố định 'SanPham'
      var snapshot = await collection.find(where.eq('_id', id)).toList(); // Truy vấn dữ liệu chỉ lấy ra dựa trên _id

      List<SanPham> sanphamList = [];
      for (var data in snapshot) {
        sanphamList.add(SanPham.fromJson(data as Map<String, dynamic>));
      }
      print('Number of items in sanphamList: ${sanphamList.length}');

      return sanphamList;
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      // await dbSP.close();
    }
  }

  Future<List<DonHang>> laydulieuBilladmin(String collectionName) async {
    Db dbSP;
    // User? user =  _authService.getCurrentUser();
    // String uid = user!.uid;
    try {
      dbSP = await Db.create(MONGO_URL);
      await dbSP.open(); // Mở kết nối đến MongoDB
      var collection = dbSP.collection(collectionName);
      var snapshot = await collection.find().toList();

      List<DonHang> billList = [];
      for (var data in snapshot) {
        billList.add(DonHang.fromJson(data));
      }
      print('Number of items in billList: ${billList.length}');

      return billList;
    } catch (e) {
      print("Error: $e");
      return [];
    } finally {
      // Đóng kết nối đến cơ sở dữ liệu sau khi hoàn thành
      // await dbSP.close();
    }
  }

  //hàm  thêm dữ liệu
  Future<String?> insertComment(String collectionName, String comment, String idSP) async {
    User? user =  _authService.getCurrentUser();
    String uid = user!.uid;
    try {
      Map<String, dynamic> commentdata = {
        '_id': generateId(),
        'comment' : comment,
        'uid' : uid,
        'idSP': idSP,
      };
      await connect(collectionName); // Mở kết nối đến MongoDB
      var collection = db.collection(collectionName);
      var result = await collection.insertOne(commentdata);

      if (result.isSuccess) {
        print("Data inserted successfully!");
        Fluttertoast.showToast(msg: "Nhận xét của bạn đã gửi thành công");
      } else {
        Fluttertoast.showToast(msg: "Không thể gửi nhận xét");
        print("Failed to insert data!");
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      // await db.close();
    }
  }

  // hàm lấy dữ liệu bảng Comment
  //hàm lấy dữ liệu từ bảng Categories trên mongoDB
  Future<List<NhanXet>> laydulieuComment(String collectionName, String idsp) async {
    Db db;
    User? user =  _authService.getCurrentUser();
    String uid = user!.uid;
    try {
      db = await Db.create(MONGO_URL);
      await db.open();
      var collection = db.collection(collectionName);
      var snapshot = await collection.find(where.eq('idSP', idsp)).toList();

      List<NhanXet> commentList = [];
      for (var data in snapshot) {
        commentList.add(NhanXet.FromJson(data as Map<String, dynamic>));
      }
      // print('Number of items in danhmucList: ${danhmucList}');

      return commentList;
    } catch (e) {
      return []; // Consider handling the error more informatively
    } finally {}
  }
  Future<List<Users>> fetchUsersFromFirestore(String uidList) async {
    List<Users> userList = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Users').where('uid', isEqualTo: uidList).get();
      querySnapshot.docs.forEach((doc) {
        Users user = Users.fromFirestore(doc);
        userList.add(user);
      });
    } catch (e) {
      print("Error: $e");
    }

    return userList;
  }
// hàm thực hiện chức năng gửi thông báo
  void handleMessage(RemoteMessage? message){
    if(message == null) return;
    navigatorKey.currentState?.pushNamed
      (
      '/notification_screen',
      arguments: message,
    );
  }

  Future<void> handleBackgroundMessage(RemoteMessage message)async{
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: ${message.data }');
  }
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final _firebaseMessage = FirebaseMessaging.instance;
  Future<void> initNotifications() async{
    await _firebaseMessage.requestPermission();
    final fCMToken = await _firebaseMessage.getToken();
    print('Token: $fCMToken');
    initPushNotifications();
    initLocalNotification();
  }

  final _androidChannel = const AndroidNotificationChannel(
    'high_important_channel',
    'High Important Notification',
    description: 'This channel is used for important notification ',
    importance: Importance.defaultImportance,
  );
  final _localNotification = FlutterLocalNotificationsPlugin();

  Future initPushNotifications()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert:true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if(notification == null) return;
      _localNotification.show(notification.hashCode, notification.title, notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _androidChannel.id,
            _androidChannel.name,
            channelDescription: _androidChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  Future initLocalNotification() async{
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await  _localNotification.initialize(
        settings,
        onSelectNotification: (payload){
          final message = RemoteMessage.fromMap(jsonDecode(payload!));
          handleMessage(message);
        }
    );
    final platform = _localNotification.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_androidChannel);

  }



}
