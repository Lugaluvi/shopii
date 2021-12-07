import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _itemsCollection = _firestore.collection('items');
final _usersCollection = _firestore.collection('users');

class ShopiiService {
  static Future<void> createUser({
    required String? personEmail,
    required String? personName,
  }) async {
    DocumentReference user = _usersCollection.doc();

    Map<String, dynamic> data = {
      'person_email': personEmail,
      'person_name': personName,
    };

    await user
        .set(data)
        .whenComplete(() => print('Usuário criado!'))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> userInfo({
    required String? userEmail
  }) {
    return _usersCollection.where('person_email', isEqualTo: userEmail).snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getItems({
    required String? userEmail
  }) {
    return _itemsCollection.where('person_email', isEqualTo: userEmail).snapshots();
  }

  static Future<void> addItem({
    required String title,
    required String qnt,
    required String? personEmail,
  }) async {
    DocumentReference question = _itemsCollection.doc();

    Map<String, dynamic> data = {
      'title': title,
      'qnt': qnt,
      'person_email': personEmail,
    };

    await question
        .set(data)
        .whenComplete(() => print('Item criado!'))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    required String title,
    required String qnt,
    required String id,
  }) async {
    DocumentReference item = _itemsCollection.doc(id);

    Map<String, dynamic> data = {
      'title': title,
      'qnt': qnt,
    };

    await item
        .update(data)
        .whenComplete(() => print('Item atualizado.'))
        .catchError((e) => print(e));
  }

  static Future<void> deleteItem({required String id}) async {
    DocumentReference question = _itemsCollection.doc(id);
    await question
        .delete()
        .whenComplete(() => print('Item removido.'))
        .catchError((e) => print(e));
  }
}