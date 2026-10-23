// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUser _$AuthUserFromJson(Map<String, dynamic> json) => _AuthUser(
  userId: json['userId'] as String,
  displayName: json['displayName'] as String,
  role: $enumDecode(_$UserRoleEnumMap, json['role']),
  email: json['email'] as String?,
);

Map<String, dynamic> _$AuthUserToJson(_AuthUser instance) => <String, dynamic>{
  'userId': instance.userId,
  'displayName': instance.displayName,
  'role': _$UserRoleEnumMap[instance.role]!,
  'email': instance.email,
};

const _$UserRoleEnumMap = {
  UserRole.student: 'student',
  UserRole.facilitator: 'facilitator',
};
