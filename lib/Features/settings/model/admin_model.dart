// Model classes
enum PermissionLevel {
  orderManagement,
  customerManagement,
  merchantManagement,
}

class Admin {
  final String name;
  final String phoneNumber;
  final PermissionLevel permission;
  final DateTime addedOn;

  Admin({
    required this.name,
    required this.phoneNumber,
    required this.permission,
    required this.addedOn,
  });
}