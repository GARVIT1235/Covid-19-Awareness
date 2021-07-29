class MythCategory {
  String desc ;
  String myth;
  String imgPath;

  MythCategory(
      {
        this.desc,
        this.myth,
        this.imgPath,
      }
 );

  factory MythCategory.fromJson(Map<String, dynamic> json) {
    return MythCategory(
        desc: json['desc'],
        myth: json['myth'],
        imgPath: json['imgPath']
    );
  }
}