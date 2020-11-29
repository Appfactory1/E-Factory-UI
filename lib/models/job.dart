class Job {
  String detail;
  String sound;
  List<String> images;
  //String worker;
  //String user;
  String rating;
  String review;
  String address;

  Job(
      {this.detail,
      this.sound,
      this.images,
      //this.worker,
      //this.user,
      this.rating,
      this.review,
      this.address});

  Job.fromMap(Map snapshot)
      : detail = snapshot['detail'] ?? '',
        sound = snapshot['sound'] ?? '',
        images = snapshot['images'] ?? '',
        //worker = snapshot['worker'] ?? '',
        //user = snapshot['user'] ?? '',
        rating = snapshot['rating'] ?? '',
        review = snapshot['review'] ?? '',
        address = snapshot['address'] ?? '';

  toJson() {
    return {
      "detail": detail,
      "sound": sound,
      "images": images,
      //"user": user,
      //"worker": worker,
      "rating": rating,
      "address": address,
      "review": review,
    };
  }
}
