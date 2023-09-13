// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoyaltyCardAdapter extends TypeAdapter<LoyaltyCard> {
  @override
  final int typeId = 2;

  @override
  LoyaltyCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoyaltyCard(
      id: fields[0] as String,
      referrerId: fields[1] as dynamic,
      name: fields[2] as String,
      surname: fields[3] as String?,
      middleName: fields[4] as dynamic,
      comment: fields[5] as dynamic,
      phone: fields[6] as String,
      cultureName: fields[7] as String,
      birthday: fields[8] as dynamic,
      email: fields[9] as dynamic,
      sex: fields[10] as int,
      consentStatus: fields[11] as int,
      anonymized: fields[12] as bool,
      cards: (fields[13] as List).cast<dynamic>(),
      categories: (fields[14] as List).cast<Category>(),
      walletBalances: (fields[15] as List).cast<WalletBalance>(),
      userData: fields[16] as dynamic,
      shouldReceivePromoActionsInfo: fields[17] as bool,
      shouldReceiveLoyaltyInfo: fields[18] as bool,
      shouldReceiveOrderStatusInfo: fields[19] as bool,
      isDeleted: fields[20] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LoyaltyCard obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.referrerId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.surname)
      ..writeByte(4)
      ..write(obj.middleName)
      ..writeByte(5)
      ..write(obj.comment)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.cultureName)
      ..writeByte(8)
      ..write(obj.birthday)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.sex)
      ..writeByte(11)
      ..write(obj.consentStatus)
      ..writeByte(12)
      ..write(obj.anonymized)
      ..writeByte(13)
      ..write(obj.cards)
      ..writeByte(14)
      ..write(obj.categories)
      ..writeByte(15)
      ..write(obj.walletBalances)
      ..writeByte(16)
      ..write(obj.userData)
      ..writeByte(17)
      ..write(obj.shouldReceivePromoActionsInfo)
      ..writeByte(18)
      ..write(obj.shouldReceiveLoyaltyInfo)
      ..writeByte(19)
      ..write(obj.shouldReceiveOrderStatusInfo)
      ..writeByte(20)
      ..write(obj.isDeleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoyaltyCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
