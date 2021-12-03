import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/shopii_service.dart';
import 'dart:math' as math;

class CreateItem extends StatefulWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  _CreateItemState createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  late String title = '';
  late String qnt = '';
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        height: 325,
        color: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(
                        'Criar item',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ]),
                    Transform.rotate(
                      angle: 180 * math.pi / 360,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios,
                            color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  cursorColor: const Color(0xFF5600C3),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFF5600C3)),
                    ),
                    labelText: 'Título do item',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    title = value;
                  },
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: 100.0,
                  child: TextFormField(
                    cursorColor: const Color(0xFF5600C3),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xFF5600C3)),
                      ),
                      labelText: 'Quantidade',
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                      fillColor: Colors.white,
                    ),
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                      qnt = value;
                    },
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color(0xFFB3B3B3),
                        onSurface: Colors.grey,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Voltar',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF282828),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: const Color(0xFF5600C3),
                        onSurface: Colors.grey,
                        padding: const EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async {
                        ShopiiService.addItem(title: title, qnt: qnt, personEmail: user?.email);
                        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Item criado!')));
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Criar',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
