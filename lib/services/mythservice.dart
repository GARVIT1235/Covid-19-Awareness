import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_awareness/models/mythmodel.dart';


class MythService {
  FirebaseFirestore _instance;
  List<MythCategory> _categories = [];

  List<MythCategory> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance.collection('Cov19-Data');

    DocumentSnapshot snapshot = await categories.doc('myths').get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      var categoriesData = data['myth'] as List<dynamic>;
      categoriesData.forEach((catData) {
        MythCategory cat = MythCategory.fromJson(catData);
        _categories.add(cat);
      });
    }
  }
}