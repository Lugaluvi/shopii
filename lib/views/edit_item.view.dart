import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/shopii_service.dart';
import 'dart:math' as math;

import 'home.view.dart';

class EditItem extends StatefulWidget {
  const EditItem({Key? key}) : super(key: key);

  @override
  _EditItemState createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  late String title = '';
  late String qtn = '';
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8));
  }
}
