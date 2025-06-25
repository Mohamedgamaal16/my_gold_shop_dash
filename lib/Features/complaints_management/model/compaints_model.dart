// class Complaint {
//   final String id;
//   final String customerName;
//   final String type;
//   final String description;
//   final DateTime timestamp;
//
//   Complaint({
//     required this.id,
//     required this.customerName,
//     required this.type,
//     required this.description,
//     required this.timestamp,
//   });
//
//   String get formattedId => '#$id';
//
//   String get timeAgo {
//     final now = DateTime.now();
//     final difference = now.difference(timestamp);
//
//     if (difference.inMinutes < 1) {
//       return 'Just now';
//     } else if (difference.inHours < 1) {
//       return '${difference.inMinutes}m ago';
//     } else if (difference.inDays < 1) {
//       return '${difference.inHours}h ago';
//     } else {
//       return '${difference.inDays}d ago';
//     }
//   }
// }