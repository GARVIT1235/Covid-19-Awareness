import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_awareness/models/precautionmodel.dart';


class PrecautionService {
  FirebaseFirestore _instance;
  List<PrecautionCategory> _categories = [];

  List<PrecautionCategory> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance.collection('Cov19-Data');

    DocumentSnapshot snapshot = await categories.doc('precaution').get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      var categoriesData = data['prevention'] as List<dynamic>;
      categoriesData.forEach((catData) {
        PrecautionCategory cat = PrecautionCategory.fromJson(catData);
        _categories.add(cat);
      });
    }
  }
}