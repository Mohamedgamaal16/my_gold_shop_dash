enum AlertType { success, warning, error }

class AlertModel {
  final String title;
  final String message;
  final String time;
  final AlertType type;

  AlertModel({
    required this.title,
    required this.message,
    required this.time,
    required this.type,
  });
}
