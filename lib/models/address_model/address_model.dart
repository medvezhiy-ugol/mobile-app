import 'package:hive/hive.dart';
part 'address_model.g.dart';

@HiveType(typeId: 1)
class AddressModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String apartment;

  @HiveField(2)
  final String entrance;

  @HiveField(3)
  final String floor;

  @HiveField(4)
  final String intercom;

  @HiveField(5)
  final String comment;

  AddressModel({
    required this.name,
    required this.apartment,
    required this.entrance,
    required this.floor,
    required this.intercom,
    required this.comment,
});
}