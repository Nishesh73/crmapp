// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerModelHiveAdapter extends TypeAdapter<CustomerModelHive> {
  @override
  final int typeId = 1;

  @override
  CustomerModelHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerModelHive(
      gender: fields[0] as String,
      fullName: fields[1] as String,
      email: fields[2] as String,
      profilePicture: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerModelHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.profilePicture);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerModelHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
