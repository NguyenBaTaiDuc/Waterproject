import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/view/diachi.dart';
import 'package:myapp/view/thanhtoan.dart';

import 'chitietsanphamadmin.dart';


class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;
  static const LatLng _pGooglePlex = LatLng(10.775968510851103, 106.66726337992111);
  static const LatLng _pGoogledestunation = LatLng(10.870705885509285, 106.6710452046899);
  TextEditingController _addressController = TextEditingController();

  Future<LatLng> _getLatLngFromAddress(String address) async {
    const apiKey = 'AIzaSyDeJOYJgJYNYgxlF_OcBluekEDMcHJSV6c';
    final encodedAddress = Uri.encodeComponent(address);
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$encodedAddress&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final results = json['results'] as List<dynamic>;
      if (results.isNotEmpty) {
        final location = results[0]['geometry']['location'];
        final lat = location['lat'] as double;
        final lng = location['lng'] as double;
        return LatLng(lat, lng);
      }
    }
    // Trả về vị trí mặc định nếu không tìm thấy
    return const LatLng(0, 0);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _findLocation() async {
    // Thực hiện logic để tìm vị trí trên bản đồ
    // Ví dụ: Di chuyển camera đến vị trí đã tìm thấy
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: _pGoogledestunation,
          zoom: 15, // Thay đổi mức độ zoom tùy thuộc vào yêu cầu của bạn
        ),
      ),
    );

    // Lấy thông tin vị trí để cập nhật vào TextFormField
    setState(() {
      _addressController.text =
      '${_pGoogledestunation.latitude}, ${_pGoogledestunation.longitude}';
    });
  }

  Future<void> _searchAddress(String address) async {
    final location = await _getLatLngFromAddress(address);
    // Di chuyển camera đến vị trí đã tìm thấy
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: 15, // Thay đổi mức độ zoom tùy thuộc vào yêu cầu của bạn
        ),
      ),
    );
    // Cập nhật giá trị của TextFormField với tên địa điểm
    setState(() {
      _addressController.text = address;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 411,
        height: 900,
        child: Column(
          children: [
            SizedBox(
              height: 400, // Đảm bảo bản đồ hiển thị đủ lớn
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: const CameraPosition(
                  target: _pGooglePlex,
                  zoom: 10,
                ),
                markers: {
                  const Marker(
                    markerId: MarkerId('location'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGooglePlex,
                  ),
                  const Marker(
                    markerId: MarkerId('destination'),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _pGoogledestunation,
                  ),
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                String selectedAddress = _addressController.text;
                DiaChiCungCap.selectedAddress = selectedAddress;
                _searchAddress(_addressController.text);
              }, // Gọi hàm tìm vị trí
              child: const Text('Tìm vị trí'),

            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _addressController,
              decoration: const InputDecoration(
                labelText: 'Địa chỉ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String selectedAddress = _addressController.text;
                DiaChiCungCap.selectedAddress = selectedAddress;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ThanhToan(),
                  ),
                );
                // Gọi hàm tìm kiếm địa chỉ và cập nhật vào TextFormField
                _searchAddress(_addressController.text);
              },
              child: const Text('Thêm vị trí'),
            ),
          ],
        ),
      ),
    );
  }
}
