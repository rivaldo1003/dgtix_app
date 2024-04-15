import 'package:dgtix_app/core/error/exception.dart';
import 'package:dgtix_app/data/datasource/ticket_remote_data_source.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/domain/repositories/ticket_repository.dart';

class TicketRepositoryImpl implements TicketRepository {
  final TicketRemoteDataSource ticketRemoteDataSource;

  TicketRepositoryImpl({required this.ticketRemoteDataSource});
  @override
  Future<List<Ticket>> fetchTicket() async {
    try {
      return await ticketRemoteDataSource.fetchTicket();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
