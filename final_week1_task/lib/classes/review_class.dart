import 'package:final_week1_task/classes/file_db_class.dart';

class Review extends FileDB {
  final String id = FileDB.id;
  String productId;
  String userId;
  String reviewTitle;
  String reviewContent;
  String reviewRate;

  Review(this.productId, this.userId, this.reviewTitle, this.reviewContent,
      this.reviewRate)
      : super("review.json") {
    reload();
    add(toMap());
  }

  void updateUser(Map updates) {
    updates.forEach((key, value) {
      switch (key) {
        case 'productId':
          productId = value;
          break;
        case 'userId':
          userId = value;
          break;
        case 'reviewTitle':
          reviewTitle = value;
          break;
        case 'reviewContent':
          reviewContent = value;
          break;
        case 'reviewRate':
          reviewRate = value;
          break;
        case _:
          throw AssertionError("The $key is not valid user data");
      }
    });
  }

  Map toMap() {
    return {
      "id": id,
      "productId": productId,
      "userId": userId,
      "reviewTitle": reviewTitle,
      "reviewContent": reviewContent,
      "reviewRate": reviewRate,
    };
  }
}
