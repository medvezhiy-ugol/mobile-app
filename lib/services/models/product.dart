// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        required this.id,
        required this.itemSizes,
        required this.sku,
        required this.name,
        required this.description,
        required this.allergenGroups,
        required this.itemId,
        this.modifierSchemaId,
        required this.taxCategory,
        required this.orderItemType,
    });

    String id;
    List<ItemSize> itemSizes;
    String sku;
    String name;
    String description;
    List<dynamic> allergenGroups;
    String itemId;
    dynamic modifierSchemaId;
    TaxCategory taxCategory;
    String orderItemType;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        itemSizes: List<ItemSize>.from(json["itemSizes"].map((x) => ItemSize.fromJson(x))),
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        allergenGroups: List<dynamic>.from(json["allergenGroups"].map((x) => x)),
        itemId: json["itemId"],
        modifierSchemaId: json["modifierSchemaId"],
        taxCategory: TaxCategory.fromJson(json["taxCategory"]),
        orderItemType: json["orderItemType"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "itemSizes": List<dynamic>.from(itemSizes.map((x) => x.toJson())),
        "sku": sku,
        "name": name,
        "description": description,
        "allergenGroups": List<dynamic>.from(allergenGroups.map((x) => x)),
        "itemId": itemId,
        "modifierSchemaId": modifierSchemaId,
        "taxCategory": taxCategory.toJson(),
        "orderItemType": orderItemType,
    };
}

class ItemSize {
    ItemSize({
        required this.prices,
        required this.itemModifierGroups,
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

    List<Price> prices;
    List<dynamic> itemModifierGroups;
    String sku;
    String sizeCode;
    String sizeName;
    bool isDefault;
    int portionWeightGrams;
    String sizeId;
    NutritionPerHundredGrams nutritionPerHundredGrams;
    String buttonImageUrl;
    Map<String, ButtonImageCroppedUrl> buttonImageCroppedUrl;

    factory ItemSize.fromJson(Map<String, dynamic> json) => ItemSize(
        prices: List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
        itemModifierGroups: List<dynamic>.from(json["itemModifierGroups"].map((x) => x)),
        sku: json["sku"],
        sizeCode: json["sizeCode"],
        sizeName: json["sizeName"],
        isDefault: json["isDefault"],
        portionWeightGrams: json["portionWeightGrams"],
        sizeId: json["sizeId"],
        nutritionPerHundredGrams: NutritionPerHundredGrams.fromJson(json["nutritionPerHundredGrams"]),
        buttonImageUrl: json["buttonImageUrl"],
        buttonImageCroppedUrl: Map.from(json["buttonImageCroppedUrl"]).map((k, v) => MapEntry<String, ButtonImageCroppedUrl>(k, ButtonImageCroppedUrl.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "prices": List<dynamic>.from(prices.map((x) => x.toJson())),
        "itemModifierGroups": List<dynamic>.from(itemModifierGroups.map((x) => x)),
        "sku": sku,
        "sizeCode": sizeCode,
        "sizeName": sizeName,
        "isDefault": isDefault,
        "portionWeightGrams": portionWeightGrams,
        "sizeId": sizeId,
        "nutritionPerHundredGrams": nutritionPerHundredGrams.toJson(),
        "buttonImageUrl": buttonImageUrl,
        "buttonImageCroppedUrl": Map.from(buttonImageCroppedUrl).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class ButtonImageCroppedUrl {
    ButtonImageCroppedUrl({
        required this.url,
        required this.hash,
        this.cropped,
    });

    String url;
    String hash;
    dynamic cropped;

    factory ButtonImageCroppedUrl.fromJson(Map<String, dynamic> json) => ButtonImageCroppedUrl(
        url: json["url"],
        hash: json["hash"],
        cropped: json["cropped"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "hash": hash,
        "cropped": cropped,
    };
}

class NutritionPerHundredGrams {
    NutritionPerHundredGrams({
        required this.fats,
        required this.proteins,
        required this.carbs,
        required this.energy,
        required this.organizations,
    });

    int fats;
    int proteins;
    int carbs;
    int energy;
    List<String> organizations;

    factory NutritionPerHundredGrams.fromJson(Map<String, dynamic> json) => NutritionPerHundredGrams(
        fats: json["fats"],
        proteins: json["proteins"],
        carbs: json["carbs"],
        energy: json["energy"],
        organizations: List<String>.from(json["organizations"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "fats": fats,
        "proteins": proteins,
        "carbs": carbs,
        "energy": energy,
        "organizations": List<dynamic>.from(organizations.map((x) => x)),
    };
}

class Price {
    Price({
        required this.organizationId,
        required this.price,
    });

    String organizationId;
    double price;

    factory Price.fromJson(Map<String, dynamic> json) => Price(
        organizationId: json["organizationId"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "organizationId": organizationId,
        "price": price,
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
