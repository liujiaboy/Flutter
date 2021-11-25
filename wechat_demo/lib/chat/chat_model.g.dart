// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
      json['image_url'] as String?,
      json['name'] as String?,
      json['message'] as String?,
      json['message_detail'] as String?,
    );

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
      'image_url': instance.imageUrl,
      'name': instance.name,
      'message': instance.message,
      'message_detail': instance.messageDetail,
    };
