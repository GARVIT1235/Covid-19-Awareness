class PrecautionCategory {
  String desc ;
  String prevention;
  String imgPath;

  PrecautionCategory(
      {
        this.desc,
        this.prevention,
        this.imgPath,
      }
      );

  factory PrecautionCategory.fromJson(Map<String, dynamic> json) {
    return PrecautionCategory(
        desc: json['desc'],
        prevention: json['prevention'],
        imgPath: json['imgPath']
    );
  }
}