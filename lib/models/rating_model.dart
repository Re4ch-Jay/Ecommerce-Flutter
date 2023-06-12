class RatingModel {
  dynamic? rate;
  int? count;

  RatingModel({this.rate, this.count});

  RatingModel.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
