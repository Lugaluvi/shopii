import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/views/create_item.view.dart';
import 'package:shopping_list/views/item.view.dart';

import '../shopii_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const String id = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: ShopiiService.userInfo(userEmail: user?.email),
                  builder: (context, snapshot) {
                    List<Widget> userList = [];

                    final users = snapshot.data!.docs;
                    for (var user in users) {
                      userList.add(
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Olá, ${user.data()['person_name']}',
                                  style: GoogleFonts.poppins(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10.0),
                                Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.white,
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.meeting_room_outlined,
                                    ),
                                    color: const Color(0xFF5600C3),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        ),
                      );
                    }
                    return userList.first;
                  }),
              Align(
                  alignment: Alignment.topLeft,
                  child: (Text(
                    'Essa é a sua lista de compras',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ))),
              Align(
                  alignment: Alignment.topLeft,
                  child: (Chip(
                    backgroundColor: Colors.white,
                    label: Text(
                      'Aqui era pra ter um contador',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.grey[900],
                          fontWeight: FontWeight.normal),
                    ),
                  ))),
              const SizedBox(height: 10.0),
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: ShopiiService.getItems(userEmail: user?.email),
                  builder: (context, snapshot) {
                    List<Item> itemList = [];

                    if (snapshot.data!.docs.isEmpty) {
                      return Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_task_outlined,
                            size: 100.0,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'Não existem itens',
                            style: GoogleFonts.poppins(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Crie um item no botão abaixo.',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          )
                        ],
                      ));
                    }

                    final questions = snapshot.data!.docs;
                    for (var question in questions) {
                      itemList.add(Item(
                        id: question.id,
                        title: question.data()['title'],
                        qnt: question.data()['qnt'],
                      ));
                    }

                    return Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 5.0),
                        children: itemList,
                      ),
                    );
                  }),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  const SizedBox(width: 5.0),
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
                          return const CreateItem();
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
              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
