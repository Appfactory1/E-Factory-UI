class JobSmall {
  String uid;
  String date;

  JobSmall({this.uid, this.date});

  JobSmall.fromMap(Map snapshot)
      : uid = snapshot["uid"] ?? '',
        date = snapshot['date'] ?? '';

  toJson() {
    return {
      "uid": uid,
      "date": date,
    };
  }
}
