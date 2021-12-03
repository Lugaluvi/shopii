import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final _itemsCollection = _firestore.collection('items');

class ShopiiService {
  static Stream<QuerySnapshot<Map<String, dynamic>>> getItems({
    required String? userEmail
  }) {
    return _itemsCollection.where('person_email', isEqualTo: userEmail).snapshots();
  }

  static Future<int> itemsCount({
    required String? userEmail
  }) async {
    return await _itemsCollection.where('person_email', isEqualTo: userEmail).snapshots().length;
  }

  static Future<void> addItem({
    required String title,
    required int qnt,
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
    DocumentReference note = _itemsCollection.doc(id);

    Map<String, dynamic> data = {
      'title': title,
      'qnt': qnt,
    };

    await note
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