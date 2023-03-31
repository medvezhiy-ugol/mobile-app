class ExternalMenu {
  ExternalMenu({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory ExternalMenu.fromJson(Map<String, dynamic> json) => ExternalMenu(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
