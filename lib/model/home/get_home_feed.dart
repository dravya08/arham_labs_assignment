import 'dart:convert';

HomeFeedResponse homeFeedResponseFromJson(String str) =>
    HomeFeedResponse.fromJson(json.decode(str));

String homeFeedResponseToJson(HomeFeedResponse data) =>
    json.encode(data.toJson());

class HomeFeedResponse {
  List<UserFeed> userFeeds;

  HomeFeedResponse({
    required this.userFeeds,
  });

  factory HomeFeedResponse.fromJson(Map<String, dynamic> json) =>
      HomeFeedResponse(
        userFeeds: List<UserFeed>.from(
            json["userFeeds"].map((x) => UserFeed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "userFeeds": List<dynamic>.from(userFeeds.map((x) => x.toJson())),
      };
}

class UserFeed {
  bool isOwner;
  PostUser postUser;
  List<dynamic> postLinks;
  PostMessage postMessage;
  List<dynamic> postAttachments;
  UserPostMessageDetails userPostMessageDetails;

  UserFeed({
    required this.isOwner,
    required this.postUser,
    required this.postLinks,
    required this.postMessage,
    required this.postAttachments,
    required this.userPostMessageDetails,
  });

  factory UserFeed.fromJson(Map<String, dynamic> json) => UserFeed(
        isOwner: json["isOwner"],
        postUser: PostUser.fromJson(json["postUser"]),
        postLinks: List<dynamic>.from(json["postLinks"].map((x) => x)),
        postMessage: PostMessage.fromJson(json["postMessage"]),
        postAttachments:
            List<dynamic>.from(json["postAttachments"].map((x) => x)),
        userPostMessageDetails:
            UserPostMessageDetails.fromJson(json["userPostMessageDetails"]),
      );

  Map<String, dynamic> toJson() => {
        "isOwner": isOwner,
        "postUser": postUser.toJson(),
        "postLinks": List<dynamic>.from(postLinks.map((x) => x)),
        "postMessage": postMessage.toJson(),
        "postAttachments": List<dynamic>.from(postAttachments.map((x) => x)),
        "userPostMessageDetails": userPostMessageDetails.toJson(),
      };
}

class PostMessage {
  String id;
  String message;
  String postType;
  bool isHidden;
  int likeCount;
  DateTime createdAt;
  DateTime updatedAt;
  int commentCount;
  List<CommunityGroup> communityGroups;
  dynamic locationDetails;
  dynamic locationDetailsId;
  dynamic postDoctorRecommendation;
  dynamic postDoctorRecommendationId;

  PostMessage({
    required this.id,
    required this.message,
    required this.postType,
    required this.isHidden,
    required this.likeCount,
    required this.createdAt,
    required this.updatedAt,
    required this.commentCount,
    required this.communityGroups,
    required this.locationDetails,
    required this.locationDetailsId,
    required this.postDoctorRecommendation,
    required this.postDoctorRecommendationId,
  });

  factory PostMessage.fromJson(Map<String, dynamic> json) => PostMessage(
        id: json["id"],
        message: json["message"],
        postType: json["postType"],
        isHidden: json["is_hidden"],
        likeCount: json["likeCount"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        commentCount: json["commentCount"],
        communityGroups: List<CommunityGroup>.from(
            json["communityGroups"].map((x) => CommunityGroup.fromJson(x))),
        locationDetails: json["locationDetails"],
        locationDetailsId: json["locationDetailsId"],
        postDoctorRecommendation: json["postDoctorRecommendation"],
        postDoctorRecommendationId: json["postDoctorRecommendationId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "postType": postType,
        "is_hidden": isHidden,
        "likeCount": likeCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "commentCount": commentCount,
        "communityGroups":
            List<dynamic>.from(communityGroups.map((x) => x.toJson())),
        "locationDetails": locationDetails,
        "locationDetailsId": locationDetailsId,
        "postDoctorRecommendation": postDoctorRecommendation,
        "postDoctorRecommendationId": postDoctorRecommendationId,
      };
}

class CommunityGroup {
  String id;
  String name;
  bool active;

  CommunityGroup({
    required this.id,
    required this.name,
    required this.active,
  });

  factory CommunityGroup.fromJson(Map<String, dynamic> json) => CommunityGroup(
        id: json["id"],
        name: json["name"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
      };
}

class PostUser {
  String id;
  bool isOrg;
  Profile profile;
  String username;
  String fullName;
  bool isVerified;
  bool isAnonymous;
  String? languageCode;
  String? languageTitle;
  ProfilePicture profilePicture;
  dynamic caretakerUserId;
  String profilePictureUrl;

  PostUser({
    required this.id,
    required this.isOrg,
    required this.profile,
    required this.username,
    required this.fullName,
    required this.isVerified,
    required this.isAnonymous,
    required this.languageCode,
    required this.languageTitle,
    required this.profilePicture,
    required this.caretakerUserId,
    required this.profilePictureUrl,
  });

  factory PostUser.fromJson(Map<String, dynamic> json) => PostUser(
        id: json["id"],
        isOrg: json["is_org"],
        profile: Profile.fromJson(json["profile"]),
        username: json["username"],
        fullName: json["full_name"],
        isVerified: json["is_verified"],
        isAnonymous: json["is_anonymous"],
        languageCode: json["language_code"],
        languageTitle: json["language_title"],
        profilePicture: ProfilePicture.fromJson(json["profile_picture"]),
        caretakerUserId: json["caretaker_user_id"],
        profilePictureUrl: json["profile_picture_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_org": isOrg,
        "profile": profile.toJson(),
        "username": username,
        "full_name": fullName,
        "is_verified": isVerified,
        "is_anonymous": isAnonymous,
        "language_code": languageCode,
        "language_title": languageTitle,
        "profile_picture": profilePicture.toJson(),
        "caretaker_user_id": caretakerUserId,
        "profile_picture_url": profilePictureUrl,
      };
}

class Profile {
  String gender;
  dynamic aboutMe;
  String genderText;
  DateTime dateOfBirth;

  Profile({
    required this.gender,
    required this.aboutMe,
    required this.genderText,
    required this.dateOfBirth,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        gender: json["gender"],
        aboutMe: json["about_me"],
        genderText: json["gender_text"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "about_me": aboutMe,
        "gender_text": genderText,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
      };
}

class ProfilePicture {
  String key;
  String bucket;
  String provider;
  int fileSize;
  String fileType;

  ProfilePicture({
    required this.key,
    required this.bucket,
    required this.provider,
    required this.fileSize,
    required this.fileType,
  });

  factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
        key: json["key"],
        bucket: json["bucket"],
        provider: json["provider"],
        fileSize: json["file_size"],
        fileType: json["file_type"],
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "bucket": bucket,
        "provider": provider,
        "file_size": fileSize,
        "file_type": fileType,
      };
}

class UserPostMessageDetails {
  String? react;
  List<String> reactions;

  UserPostMessageDetails({
    required this.react,
    required this.reactions,
  });

  factory UserPostMessageDetails.fromJson(Map<String, dynamic> json) =>
      UserPostMessageDetails(
        react: json["react"],
        reactions: List<String>.from(json["reactions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "react": react,
        "reactions": List<dynamic>.from(reactions.map((x) => x)),
      };
}
