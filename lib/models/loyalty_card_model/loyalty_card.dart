
import 'package:hive/hive.dart';
part 'loyalty_card.g.dart';

@HiveType(typeId: 2)
class LoyaltyCard extends HiveObject {
    @HiveField(0)
    String id;

    @HiveField(1)
    dynamic referrerId;

    @HiveField(2)
    String name;

    @HiveField(3)
    String? surname;

    @HiveField(4)
    dynamic middleName;

    @HiveField(5)
    dynamic comment;

    @HiveField(6)
    String phone;

    @HiveField(7)
    String cultureName;

    @HiveField(8)
    dynamic birthday;

    @HiveField(9)
    dynamic email;

    @HiveField(10)
    int sex;

    @HiveField(11)
    int consentStatus;

    @HiveField(12)
    bool anonymized;

    @HiveField(13)
    List<dynamic> cards;

    @HiveField(14)
    List<Category> categories;

    @HiveField(15)
    List<WalletBalance> walletBalances;

    @HiveField(16)
    dynamic userData;

    @HiveField(17)
    bool shouldReceivePromoActionsInfo;

    @HiveField(18)
    bool shouldReceiveLoyaltyInfo;

    @HiveField(19)
    bool shouldReceiveOrderStatusInfo;
    // DateTime? personalDataConsentFrom;
    // DateTime personalDataConsentTo;
    // dynamic personalDataProcessingFrom;
    // dynamic personalDataProcessingTo;

    @HiveField(20)
    bool isDeleted;

    LoyaltyCard({
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

    factory LoyaltyCard.fromJson(Map<String, dynamic> json) => LoyaltyCard(
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
