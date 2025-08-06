class NotificationModel {

  final int id;
  final String title;
  final String message;
  final String? sender;
  final DateTime eventDate;
  final String timing;
  final String datePosted;

  NotificationModel({
    required this.id,
    required this.message,
    this.sender,
    required this.eventDate,
    required this.timing,
    required this.datePosted,
    required this.title,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json){
    return NotificationModel(
      id: json['id']?? '',
      message: json['message']?? '',
      eventDate: DateTime.parse(json['eventDate']),
      timing: json['timing']?? '',
      datePosted: json['datePosted']?? '',
      title: json['title']?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'message': message,
      'sender': sender,
      'eventDate': eventDate.toIso8601String(),
      'timing': timing,
    };
  }



}