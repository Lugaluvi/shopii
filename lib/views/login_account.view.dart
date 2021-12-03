import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'home.view.dart';

class LoginAccount extends StatefulWidget {
  const LoginAccount({Key? key}) : super(key: key);

  @override
  _LoginAccountState createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

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
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Text(
                        'Entrar na conta',
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
                    labelText: 'Insira seu e-mail',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  obscureText: true,
                  cursorColor: const Color(0xFF5600C3),
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                      BorderSide(color: Color(0xFF5600C3)),
                    ),
                    labelText: 'Informe sua senha',
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                    fillColor: Colors.white,
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    password = value;
                  },
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
                        await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        Navigator.pushNamed(context, Home.id);
                      },
                      child: Text(
                        'Continuar',
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
