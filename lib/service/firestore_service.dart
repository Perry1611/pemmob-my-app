import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  final String id;
  final String name;
  final int point;

  Item({
   required this.id,
   required this.name,
   required this.point,
  });

  factory Item.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    return Item(
      id: doc.id,
      name: data['name'] as String? ?? 'Tidak ada nama',
      point: (data['point'] as num?)?.toInt() ?? 0
    );
  }
}

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Item>> getItems() {
    return _db.collection('user_items')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Item.fromFirestore(doc)).toList()
    );
  }

  Future<DocumentReference<Map<String, dynamic>>> addItem(String name, int point) {
    return _db.collection('user_items').add({
      'name': name,
      'point': point
    });
  }

  Future<void> updateItem(String id, String name, int point){
    return _db.collection('user_items').doc(id).update({
      'name': name,
      'point': point
    });
  }

  Future<void> deleteItem(String id){
    return _db.collection('user_items').doc(id).delete();
  }
}