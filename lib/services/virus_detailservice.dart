import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covid_19_awareness/models/virus_detailmodel.dart';

class VirusService {
  FirebaseFirestore _instance;
  List<VirusCategory> _categories = [];

  List<VirusCategory> getCategories() {
    return _categories;
  }

  Future<void> getCategoriesCollectionFromFirebase() async {
    _instance = FirebaseFirestore.instance;
    CollectionReference categories = _instance.collection('Cov19-Data');

    DocumentSnapshot snapshot = await categories.doc('virus detail').get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
      var categoriesData = data['detail'] as List<dynamic>;
      categoriesData.forEach((catData) {
        VirusCategory cat = VirusCategory.fromJson(catData);
        _categories.add(cat);
      });
    }
  }
}