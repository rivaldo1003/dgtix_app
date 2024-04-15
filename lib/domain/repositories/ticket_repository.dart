import 'package:dgtix_app/domain/entities/ticket.dart';

abstract class TicketRepository {
  Future<List<Ticket>> fetchTicket();
}
