// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) => Tweet(
      json['id'] as int,
      json['author'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'message': instance.message,
    };
