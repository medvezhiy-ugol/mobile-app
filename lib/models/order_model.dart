class OrderModel {
  final String id;
  final String organizationId;
  final int timestamp;
  final String creationStatus;

  OrderModel({
    required this.id,
    required this.organizationId,
    required this.timestamp,
    required this.creationStatus,
  });

  static OrderModel fromJson(Map<String, dynamic> data) {
    return OrderModel(
      id: data['id'],
      organizationId: data['organizationId'],
      timestamp: data['timestamp'],
      creationStatus: data['creationStatus'],
    );
  }
}