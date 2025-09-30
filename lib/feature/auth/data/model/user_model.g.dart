// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[0] as int?,
      email: fields[1] as String?,
      username: fields[2] as String?,
      phone: fields[3] as String?,
      image: fields[4] as String?,
      token: fields[5] as String?,
      isActiveWallet: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.token)
      ..writeByte(6)
      ..write(obj.isActiveWallet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['user_id'] as num?)?.toInt(),
      email: json['user_emailgoogle'] as String?,
      username: json['user_name'] as String?,
      phone: json['user_phone'] as String?,
      image: json['user_image'] as String?,
      token: json['user_token'] as String?,
      isActiveWallet: json['active_wallet'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'user_id': instance.id,
      'user_emailgoogle': instance.email,
      'user_name': instance.username,
      'user_phone': instance.phone,
      'user_image': instance.image,
      'user_token': instance.token,
      'active_wallet': instance.isActiveWallet,
    };
