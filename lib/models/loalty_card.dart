
// To parse this JSON data, do
//
//     final loaltyCard = loaltyCardFromJson(jsonString);

import 'dart:convert';

LoaltyCard loaltyCardFromJson(String str) => LoaltyCard.fromJson(json.decode(str));

String loaltyCardToJson(LoaltyCard data) => json.encode(data.toJson());

class LoaltyCard {
    String id;
    dynamic referrerId;
    String name;
    String surname;
    dynamic middleName;
    dynamic comment;
    String phone;
    String cultureName;
    dynamic birthday;
    dynamic email;
    int sex;
    int consentStatus;
    bool anonymized;
    List<dynamic> cards;
    List<Category> categories;
    List<WalletBalance> walletBalances;
    dynamic userData;
    bool shouldReceivePromoActionsInfo;
    bool shouldReceiveLoyaltyInfo;
    bool shouldReceiveOrderStatusInfo;
    // DateTime? personalDataConsentFrom;
    // DateTime personalDataConsentTo;
    // dynamic personalDataProcessingFrom;
    // dynamic personalDataProcessingTo;
    bool isDeleted;

    LoaltyCard({
        required this.id,
        this.referrerId,
        required this.name,
        required this.surname,
        this.middleName,
        this.comment,
        required this.phone,
        required this.cultureName,
        this.birthday,
        this.email,
        required this.sex,
        required this.consentStatus,
        required this.anonymized,
        required this.cards,
        required this.categories,
        required this.walletBalances,
        this.userData,
        required this.shouldReceivePromoActionsInfo,
        required this.shouldReceiveLoyaltyInfo,
        required this.shouldReceiveOrderStatusInfo,
        // required this.personalDataConsentFrom,
        // required this.personalDataConsentTo,
        // this.personalDataProcessingFrom,
        // this.personalDataProcessingTo,
        required this.isDeleted,
    });

    factory LoaltyCard.fromJson(Map<String, dynamic> json) => LoaltyCard(
        id: json["id"],
        referrerId: json["referrerId"],
        name: json["name"],
        surname: json["surname"],
        middleName: json["middleName"],
        comment: json["comment"],
        phone: json["phone"],
        cultureName: json["cultureName"],
        birthday: json["birthday"],
        email: json["email"],
        sex: json["sex"],
        consentStatus: json["consentStatus"],
        anonymized: json["anonymized"],
        cards: List<dynamic>.from(json["cards"].map((x) => x)),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        walletBalances: List<WalletBalance>.from(json["walletBalances"].map((x) => WalletBalance.fromJson(x))),
        userData: json["userData"],
        shouldReceivePromoActionsInfo: json["shouldReceivePromoActionsInfo"],
        shouldReceiveLoyaltyInfo: json["shouldReceiveLoyaltyInfo"],
        shouldReceiveOrderStatusInfo: json["shouldReceiveOrderStatusInfo"],
        // personalDataConsentFrom: DateTime.parse(json["personalDataConsentFrom"]),
        // personalDataConsentTo: DateTime.parse(json["personalDataConsentTo"]),
        // personalDataProcessingFrom: json["personalDataProcessingFrom"],
        // personalDataProcessingTo: json["personalDataProcessingTo"],
        isDeleted: json["isDeleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "referrerId": referrerId,
        "name": name,
        "surname": surname,
        "middleName": middleName,
        "comment": comment,
        "phone": phone,
        "cultureName": cultureName,
        "birthday": birthday,
        "email": email,
        "sex": sex,
        "consentStatus": consentStatus,
        "anonymized": anonymized,
        "cards": List<dynamic>.from(cards.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "walletBalances": List<dynamic>.from(walletBalances.map((x) => x.toJson())),
        "userData": userData,
        "shouldReceivePromoActionsInfo": shouldReceivePromoActionsInfo,
        "shouldReceiveLoyaltyInfo": shouldReceiveLoyaltyInfo,
        "shouldReceiveOrderStatusInfo": shouldReceiveOrderStatusInfo,
        // "personalDataConsentFrom": personalDataConsentFrom.toIso8601String(),
        // "personalDataConsentTo": personalDataConsentTo.toIso8601String(),
        // "personalDataProcessingFrom": personalDataProcessingFrom,
        // "personalDataProcessingTo": personalDataProcessingTo,
        "isDeleted": isDeleted,
    };
}

class Category {
    String id;
    String name;
    bool isActive;
    bool isDefaultForNewGuests;

    Category({
        required this.id,
        required this.name,
        required this.isActive,
        required this.isDefaultForNewGuests,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        isActive: json["isActive"],
        isDefaultForNewGuests: json["isDefaultForNewGuests"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "isActive": isActive,
        "isDefaultForNewGuests": isDefaultForNewGuests,
    };
}

class WalletBalance {
    String id;
    String name;
    int type;
    double balance;

    WalletBalance({
        required this.id,
        required this.name,
        required this.type,
        required this.balance,
    });

    factory WalletBalance.fromJson(Map<String, dynamic> json) => WalletBalance(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        balance: json["balance"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "balance": balance,
    };
}
