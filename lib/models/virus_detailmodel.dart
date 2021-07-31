class VirusCategory {
  String desc ;
  String detail;

  VirusCategory(
      {
        this.desc,
        this.detail,
      }
      );

  factory VirusCategory.fromJson(Map<String, dynamic> json) {
    return VirusCategory(
        desc: json['desc'],
        detail: json['detail']
    );
  }
}