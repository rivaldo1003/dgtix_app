class Ticket {
  final int id;
  final String eventName;
  final String eventPlace;
  final String eventSchedule;
  final int availableTicket;
  final int quotaEvent;
  final int price;
  final String eventDescription;

  Ticket({
    required this.id,
    required this.eventName,
    required this.eventPlace,
    required this.eventSchedule,
    required this.availableTicket,
    required this.quotaEvent,
    required this.price,
    required this.eventDescription,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'] ?? 0,
      eventName: json['event_name'] ?? '',
      eventPlace: json['event_place'] ?? '',
      eventSchedule: json['event_schedule'] ?? '',
      availableTicket: json['available_ticket'] ?? 0,
      quotaEvent: json['quota_event'] ?? 0,
      price: json['price'] ?? 0,
      eventDescription: json['event_description'] ?? '',
    );
  }
}
