// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreUser _$$_FirestoreUserFromJson(Map<String, dynamic> json) =>
    _$_FirestoreUser(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userName: json['userName'] as String,
      email: json['email'] as String,
      userImageURL: json['userImageURL'] as String,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_FirestoreUserToJson(_$_FirestoreUser instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'userName': instance.userName,
      'email': instance.email,
      'userImageURL': instance.userImageURL,
      'uid': instance.uid,
    };
