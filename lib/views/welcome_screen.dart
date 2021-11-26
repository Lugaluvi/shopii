import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import 'package:shopping_list/views/create_account.view.dart';
import 'package:shopping_list/views/login_account.view.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 200.0,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'Crie suas listas de compras com facilidade.',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Com Shopii você organiza suas compras de uma maneira rápida e fácil.',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color(0xFF5600C3),
                onSurface: Colors.grey,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return CreateAccount();
                  },
                );
              },
              child: Text(
                'Criar conta',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color(0xFFB3B3B3),
                onSurface: Colors.grey,
                padding: EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                showModalBottomSheet<void>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return LoginAccount();
                  },
                );
              },
              child: Text(
                'Entrar na conta',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF282828),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
