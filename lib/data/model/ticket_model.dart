import 'package:dgtix_app/domain/entities/ticket.dart';

class TicketModel extends Ticket {
  TicketModel({
    required super.id,
    required super.availableTicket,
    required super.eventDescription,
    required super.eventName,
    required super.eventSchedule,
    required super.eventPlace,
    required super.price,
    required super.quotaEvent,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      id: json['id'] ?? 0,
      availableTicket: json['available_ticket'] ?? 0,
      eventDescription: json['event_description'] ?? '',
      eventName: json['event_name'] ?? '',
      eventSchedule: json['event_schedule'] ?? '',
      eventPlace: json['event_place'] ?? '',
      price: json['price'] ?? 0,
      quotaEvent: json['quota_event'] ?? 0,
    );
  }
}
