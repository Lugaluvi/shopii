import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/views/create_item.view.dart';
import 'package:shopping_list/views/item.view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const String id = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 15, 25, 0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Olá, Usuário',
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10.0),
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        'https://pbs.twimg.com/media/E-OkEiVXMAIKgkw?format=jpg&name=small'),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Align(
                  alignment: Alignment.topLeft,
                  child: (Text(
                    'Essa é a sua lista de compras',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ))),
              const SizedBox(height: 5.0),
              Align(
                  alignment: Alignment.topLeft,
                  child: (Text(
                    '12 itens',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white54,
                        fontWeight: FontWeight.normal),
                  ))),
              const SizedBox(height: 20.0),
              Item(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Color(0xFFB3B3B3),
                      onSurface: Colors.grey,
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Sair',
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
                    onPressed: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return CreateItem();
                        },
                      );
                    },
                    child: Text(
                      'Adicionar',
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
              SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
