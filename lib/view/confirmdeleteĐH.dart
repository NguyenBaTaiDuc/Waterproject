import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/method/function.dart';

import '../model/sanpham.dart';

class ConfirmationDialogDH extends StatefulWidget {
  final String collectionName;
  final String id;
  final Function onDeleteSuccess;
  final String productName; // Thêm trường này để lưu tên sản phẩm


  ConfirmationDialogDH({super.key,
    required this.collectionName,
    required this.id,
    required this.onDeleteSuccess, required this.productName,
  });

  @override
  _ConfirmationDialogDHState createState() => _ConfirmationDialogDHState();
}

class _ConfirmationDialogDHState extends State<ConfirmationDialogDH> {
  bool _isDeleting = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Xóa sản phẩm'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Bạn có chắc chắn muốn xóa đơn hàng ${widget.productName} ?'),
          if (_isDeleting)
            const CircularProgressIndicator(), // Hiển thị CircularProgress nếu đang xóa
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: _isDeleting
              ? null
              : () {
            Navigator.of(context).pop();
          },
          child: const Text('Không xóa'),
        ),
        TextButton(
          onPressed: _isDeleting
              ? null
              : () async {
            setState(() {
              _isDeleting = true;
            });
            try {
              await Method(). deleteDonHang(widget.collectionName, widget.id).then((_) {
                // Gọi hàm callback để cập nhật tổng tiền
                widget.onDeleteSuccess();
              });
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();

              Fluttertoast.showToast(msg: "Xóa đơn hàng thành công");
            } catch (e) {
              print('Error deleting product: $e');
              Fluttertoast.showToast(msg: "Xóa đơn hàng thất bại");
            } finally {
              setState(() {
                _isDeleting = false;
              });
            }
          },
          child: const Text('Xóa'),
        ),
      ],
    );
  }
}
