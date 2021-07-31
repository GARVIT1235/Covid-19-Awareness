class SymptomCategory {
  String desc ;
  String symptom;
  String imgPath;

  SymptomCategory(
      {
        this.desc,
        this.symptom,
        this.imgPath,
      }
      );

  factory SymptomCategory.fromJson(Map<String, dynamic> json) {
    return SymptomCategory(
        desc: json['desc'],
        symptom: json['symptom'],
        imgPath: json['imgPath']
    );
  }
}