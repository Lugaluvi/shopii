import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/views/welcome.view.dart';
import 'package:shopping_list/views/home.view.dart';

void main() {
  runApp(const ShoppiApp());
}

class ShoppiApp extends StatefulWidget {
  const ShoppiApp({Key? key}) : super(key: key);

  @override
  State<ShoppiApp> createState() => _ShoppiAppState();
}

class _ShoppiAppState extends State<ShoppiApp> {
  late Future<FirebaseApp> _firebaseInit;

  Future<FirebaseApp> _initializeFirebase() async {
    return await Firebase.initializeApp();
  }

  @override
  void initState() {
    _firebaseInit = _initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _firebaseInit,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: Text('Não foi possível conectar com o banco de dados.',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(initialRoute: Welcome.id, routes: {
            Welcome.id: (context) => const Welcome(),
            Home.id: (context) => const Home(),
          });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
