import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_awareness/models/symptommodel.dart';

class SymptomService {
  FirebaseFirestore _instance;
  List<SymptomCategory> _categories = [];

  List<SymptomCategory> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance.collection('Cov19-Data');

    DocumentSnapshot snapshot = await categories.doc('symptoms').get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      var categoriesData = data['symptom'] as List<dynamic>;
      categoriesData.forEach((catData) {
        SymptomCategory cat = SymptomCategory.fromJson(catData);
        _categories.add(cat);
      });
    }
  }
}