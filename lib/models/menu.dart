import 'package:medvezhiy_ugol/models/product.dart';

class MenuCategory {
  MenuCategory({
    required this.items,
    required this.id,
    required this.name,
    // required this.description,
    // required this.buttonImageUrl,
    // required this.headerImageUrl,
    required this.iikoGroupId,
  });

  final List<MenuProduct> items;
  final String id;
  final String name;
  // String description;
  // String buttonImageUrl;
  // String? headerImageUrl;
  final String iikoGroupId;

  factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
        items: List<MenuProduct>.from(
            json["items"].map((x) => MenuProduct.fromJson(x))),
        id: json["id"],
        name: json["name"],
        // description: json["description"],
        // buttonImageUrl: json["buttonImageUrl"],
        // headerImageUrl: json["headerImageUrl"],
        iikoGroupId: json["iikoGroupId"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "id": id,
        "name": name,
        // "description": description,
        // "buttonImageUrl": buttonImageUrl,
        // "headerImageUrl": headerImageUrl,
        "iikoGroupId": iikoGroupId,
      };
}

class MenuProduct {
  MenuProduct({
    required this.id,
    required this.itemSizes,
    required this.sku,
    required this.name,
    required this.description,
    // required this.allergenGroups,
    // required this.modifierSchemaId,
    // required this.taxCategory,
    required this.orderItemType,
  });

  final String id;
  final List<ItemSize> itemSizes;
  final String sku;
  final String name;
  final String description;
  // final List<AllergenGroup> allergenGroups;
  // final String? modifierSchemaId;
  // final TaxCategory taxCategory;
  final String orderItemType;

  factory MenuProduct.fromJson(Map<String, dynamic> json) => MenuProduct(
        id: json["itemId"],
        itemSizes: List<ItemSize>.from(
            json["itemSizes"].map((x) => ItemSize.fromJson(x))),
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        // allergenGroups: List<AllergenGroup>.from(
        //     json["allergenGroups"].map((x) => AllergenGroup.fromJson(x))),
        // modifierSchemaId: json["modifierSchemaId"],
        // taxCategory: TaxCategory.fromJson(json["taxCategory"]),
        orderItemType: json["orderItemType"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "itemSizes": List<dynamic>.from(itemSizes.map((x) => x.toJson())),
        "sku": sku,
        "name": name,
        "description": description,
        // "allergenGroups":
        //     List<dynamic>.from(allergenGroups.map((x) => x.toJson())),
        // "modifierSchemaId": modifierSchemaId,
        // "taxCategory": taxCategory.toJson(),
        "orderItemType": orderItemType,
      };
}

class AllergenGroup {
  AllergenGroup({
    required this.id,
    required this.code,
    required this.name,
  });

  String id;
  String code;
  String name;

  factory AllergenGroup.fromJson(Map<String, dynamic> json) => AllergenGroup(
        id: json["id"],
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
      };
}

class ItemSize {
  ItemSize({
    required this.prices,
    // required this.itemModifierGroups,
    required this.sku,
    required this.sizeCode,
    required this.sizeName,
    required this.isDefault,
    required this.portionWeightGrams,
    required this.sizeId,
    required this.nutritionPerHundredGrams,
    required this.buttonImageUrl,
    required this.buttonImageCroppedUrl,
  });

  List<MenuPrice> prices;
  // List<ItemModifierGroup> itemModifierGroups;
  String sku;
  String? sizeCode;
  String? sizeName;
  bool isDefault;
  int portionWeightGrams;
  String? sizeId;
  NutritionPerHundredGrams nutritionPerHundredGrams;
  String? buttonImageUrl;
  ButtonImageCroppedUrl buttonImageCroppedUrl;

  factory ItemSize.fromJson(Map<String, dynamic> json) => ItemSize(
        prices: List<MenuPrice>.from(
            json["prices"].map((x) => MenuPrice.fromJson(x))),
        // itemModifierGroups: List<ItemModifierGroup>.from(
        //     json["itemModifierGroups"]
        //         .map((x) => ItemModifierGroup.fromJson(x))),
        sku: json["sku"],
        sizeCode: json["sizeCode"],
        sizeName: json["sizeName"],
        isDefault: json["isDefault"],
        portionWeightGrams: json["portionWeightGrams"],
        sizeId: json["sizeId"],
        nutritionPerHundredGrams:
            NutritionPerHundredGrams.fromJson(json["nutritionPerHundredGrams"]),
        buttonImageUrl: json["buttonImageUrl"],
        buttonImageCroppedUrl: ButtonImageCroppedUrl.fromJson(
            json["buttonImageCroppedUrl"] ?? {'': ''}),
      );

  Map<String, dynamic> toJson() => {
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
        // "itemModifierGroups":
        //     List<dynamic>.from(itemModifierGroups.map((x) => x.toJson())),
        "sku": sku,
        "sizeCode": sizeCode,
        "sizeName": sizeName,
        "isDefault": isDefault,
        "portionWeightGrams": portionWeightGrams,
        "sizeId": sizeId,
        "nutritionPerHundredGrams": nutritionPerHundredGrams.toJson(),
        "buttonImageUrl": buttonImageUrl,
        "buttonImageCroppedUrl": buttonImageCroppedUrl.toJson(),
      };
}

class ButtonImageCroppedUrl {
  ButtonImageCroppedUrl();

  factory ButtonImageCroppedUrl.fromJson(Map<String, dynamic> json) =>
      ButtonImageCroppedUrl();

  Map<String, dynamic> toJson() => {};
}

class ItemModifierGroup {
  ItemModifierGroup({
    required this.items,
    required this.name,
    required this.description,
    required this.restrictions,
    required this.canBeDivided,
    required this.itemGroupId,
    required this.childModifiersHaveMinMaxRestrictions,
    required this.sku,
  });

  List<ItemModifierGroupItem> items;
  String name;
  String description;
  Restrictions restrictions;
  bool canBeDivided;
  String itemGroupId;
  bool childModifiersHaveMinMaxRestrictions;
  String sku;

  factory ItemModifierGroup.fromJson(Map<String, dynamic> json) =>
      ItemModifierGroup(
        items: List<ItemModifierGroupItem>.from(
            json["items"].map((x) => ItemModifierGroupItem.fromJson(x))),
        name: json["name"],
        description: json["description"],
        restrictions: Restrictions.fromJson(json["restrictions"]),
        canBeDivided: json["canBeDivided"],
        itemGroupId: json["itemGroupId"],
        childModifiersHaveMinMaxRestrictions:
            json["childModifiersHaveMinMaxRestrictions"],
        sku: json["sku"],
      );

  Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "name": name,
        "description": description,
        "restrictions": restrictions.toJson(),
        "canBeDivided": canBeDivided,
        "itemGroupId": itemGroupId,
        "childModifiersHaveMinMaxRestrictions":
            childModifiersHaveMinMaxRestrictions,
        "sku": sku,
      };
}

class ItemModifierGroupItem {
  ItemModifierGroupItem({
    required this.prices,
    required this.sku,
    required this.name,
    required this.description,
    required this.buttonImage,
    required this.restrictions,
    required this.allergenGroups,
    required this.nutritionPerHundredGrams,
    required this.portionWeightGrams,
    required this.tags,
    required this.itemId,
  });

  List<MenuPrice> prices;
  String sku;
  String name;
  String description;
  String? buttonImage;
  Restrictions restrictions;
  List<AllergenGroup> allergenGroups;
  ButtonImageCroppedUrl nutritionPerHundredGrams;
  double portionWeightGrams;
  List<Tag> tags;
  String itemId;

  factory ItemModifierGroupItem.fromJson(Map<String, dynamic> json) =>
      ItemModifierGroupItem(
        prices: List<MenuPrice>.from(
            json["prices"].map((x) => MenuPrice.fromJson(x))),
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        buttonImage: json["buttonImage"],
        restrictions: Restrictions.fromJson(json["restrictions"]),
        allergenGroups: List<AllergenGroup>.from(
            json["allergenGroups"].map((x) => AllergenGroup.fromJson(x))),
        nutritionPerHundredGrams:
            ButtonImageCroppedUrl.fromJson(json["nutritionPerHundredGrams"]),
        portionWeightGrams: json["portionWeightGrams"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        itemId: json["itemId"],
      );

  Map<String, dynamic> toJson() => {
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
        "sku": sku,
        "name": name,
        "description": description,
        "buttonImage": buttonImage,
        "restrictions": restrictions.toJson(),
        "allergenGroups":
            List<dynamic>.from(allergenGroups.map((x) => x.toJson())),
        "nutritionPerHundredGrams": nutritionPerHundredGrams.toJson(),
        "portionWeightGrams": portionWeightGrams,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "itemId": itemId,
      };
}

class MenuPrice {
  MenuPrice({
    required this.organizationId,
    required this.price,
  });

  String organizationId;
  double price;

  factory MenuPrice.fromJson(Map<String, dynamic> json) => MenuPrice(
        organizationId: json["organizationId"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "organizationId": organizationId,
        "price": price,
      };
}

class Restrictions {
  Restrictions({
    required this.minQuantity,
    required this.maxQuantity,
    required this.freeQuantity,
    required this.byDefault,
  });

  int minQuantity;
  int maxQuantity;
  int freeQuantity;
  int byDefault;

  factory Restrictions.fromJson(Map<String, dynamic> json) => Restrictions(
        minQuantity: json["minQuantity"],
        maxQuantity: json["maxQuantity"],
        freeQuantity: json["freeQuantity"],
        byDefault: json["byDefault"],
      );

  Map<String, dynamic> toJson() => {
        "minQuantity": minQuantity,
        "maxQuantity": maxQuantity,
        "freeQuantity": freeQuantity,
        "byDefault": byDefault,
      };
}

class Tag {
  Tag({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class TaxCategory {
  TaxCategory({
    required this.id,
    required this.name,
    required this.percentage,
  });

  String id;
  String name;
  int percentage;

  factory TaxCategory.fromJson(Map<String, dynamic> json) => TaxCategory(
        id: json["id"],
        name: json["name"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "percentage": percentage,
      };
}
