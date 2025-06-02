class ActivityModel {
  final String title;
  final String subtitle;
  final String time;
  final String? buttonLabel;

  ActivityModel({
    required this.title,
    required this.subtitle,
    required this.time,
    this.buttonLabel,
  });
}
