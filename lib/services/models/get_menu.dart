// To parse this JSON data, do
//
//     final getMenu = getMenuFromJson(jsonString);

import 'dart:convert';

GetMenu getMenuFromJson(String str) => GetMenu.fromJson(json.decode(str));

String getMenuToJson(GetMenu data) => json.encode(data.toJson());

class GetMenu {
    GetMenu({
        required this.correlationId,
        required this.externalMenus,
        this.priceCategories,
    });

    String correlationId;
    List<ExternalMenu> externalMenus;
    dynamic priceCategories;

    factory GetMenu.fromJson(Map<String, dynamic> json) => GetMenu(
        correlationId: json["correlationId"],
        externalMenus: List<ExternalMenu>.from(json["externalMenus"].map((x) => ExternalMenu.fromJson(x))),
        priceCategories: json["priceCategories"],
    );

    Map<String, dynamic> toJson() => {
        "correlationId": correlationId,
        "externalMenus": List<dynamic>.from(externalMenus.map((x) => x.toJson())),
        "priceCategories": priceCategories,
    };
}

class ExternalMenu {
    ExternalMenu({
        required this.id,
        required this.name,
    });

    String id;
    String name;

    factory ExternalMenu.fromJson(Map<String, dynamic> json) => ExternalMenu(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
