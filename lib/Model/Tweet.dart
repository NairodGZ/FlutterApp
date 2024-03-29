import 'package:json_annotation/json_annotation.dart';

part 'Tweet.g.dart';

@JsonSerializable()
class Tweet
{
  int id;
  String author;
  String message;

  Tweet(this.id, this.author, this.message);

  // static Tweet tweetFromJson(Map<String, dynamic> json )
  // {
  //   return Tweet(json['id'], json['author'], json['message']);
  // }

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$TweetToJson(this);

}