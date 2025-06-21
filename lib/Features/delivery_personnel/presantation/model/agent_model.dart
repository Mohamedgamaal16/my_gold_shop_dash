class AgentModel {
  final String name;
  final String id;
  final String status;
  final String location;
  final String assignedPoint;
  final String? locationUrl;

  AgentModel({
    required this.name,
    required this.id,
    required this.status,
    required this.location,
    required this.assignedPoint,
    this.locationUrl,
  });
}