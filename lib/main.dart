import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/method/function.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/view/admin.dart';
import 'package:myapp/view/camon.dart';
import 'package:myapp/view/homepage.dart';
import 'package:myapp/view/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();
	if (kIsWeb) {
		await Firebase.initializeApp(
			options: DefaultFirebaseOptions.currentPlatform,

		);
	} else {
		await Firebase.initializeApp();
		await Method().initNotifications();
	}// thông báo ngoài ứng dụng
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
	return MaterialApp(
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
		navigatorKey: navigatorKey,
		scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home:   Scaffold(
		body: SingleChildScrollView(
			child: GioiThieu(),
		),
		),
		routes: {
			'/customer_home': (context) => const TrangChuKhachHang(),
			'/admin_home': (context) => const TrangChuAdmin(),
			'/notification_screen': (context)=> const Camon(),
		},
	);
	}
}
