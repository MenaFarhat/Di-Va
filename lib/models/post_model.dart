
import 'package:diva/models/user_model.dart';

class PostModel {
  String? postId;
  String? photo;
  int? userId;
  List<dynamic>? interestId = [];
  DateTime? updatedAt;
  DateTime? createdAt;
  String? content;
  String? isPrometed;
  List<dynamic>? upvotesUserId = [];
  List<dynamic>? downvotesUserId = [];
  int? commentsNumber;
  int? downVotesNumber;
  String? react;
  int? upVotesNumber;
  UserModel? user;

  PostModel({
    this.postId,
    this.photo,
    this.userId,
    this.interestId,
    this.updatedAt,
    this.createdAt,
    this.content,
    this.isPrometed,
    this.upvotesUserId,
    this.downvotesUserId,
    this.commentsNumber,
    this.downVotesNumber,
    this.react,
    this.upVotesNumber,
    this.user,
  });
// List<int> numbers = strs.map(int.parse).toList();
  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['_id'];
    photo = json['photo'];
    userId = json['user_id'];
    List<String>? interestIdString = json['interest_id'].cast<String>();
    for (var element in interestIdString!) {
      interestId!.add(int.parse(element) - 1);
    }

    // interestId = interestIdString!.map(int.parse).toList();
    updatedAt = DateTime.parse(json["updated_at"]);
    createdAt = DateTime.parse(json["created_at"]);
    content = json['content'];
    isPrometed = json['is_prometed'];
    if (json['upvotes_user_id'] != null) {
      upvotesUserId = json['upvotes_user_id'];
    }
    if (json['downvotes_user_id'] != null) {
      downvotesUserId = json['downvotes_user_id'];
    }
    json['Comments_Number'] != null
        ? commentsNumber = json['Comments_Number']["original"]
        : commentsNumber = null;
    upVotesNumber = json['UpVotes_Number'];
    downVotesNumber = json['DownVotes_Number'];
    react = json['React'];
    json['User'] != null
        ? user = UserModel.fromJson(json['User'])
        : user = null;
  }
}
