import 'package:dgtix_app/core/error/exception.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/domain/repositories/ticket_repository.dart';

class GetTicketUseCase {
  final TicketRepository ticketRepository;

  GetTicketUseCase({required this.ticketRepository});

  Future<List<Ticket>> execute() async {
    try {
      return await ticketRepository.fetchTicket();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
