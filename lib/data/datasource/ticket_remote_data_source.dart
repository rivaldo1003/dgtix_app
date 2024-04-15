import 'dart:convert';

import 'package:dgtix_app/core/error/exception.dart';
import 'package:dgtix_app/core/utils/api_client.dart';
import 'package:dgtix_app/domain/entities/ticket.dart';

abstract class TicketRemoteDataSource {
  Future<List<Ticket>> fetchTicket();
}

class TicketRemoteDataSourceImpl implements TicketRemoteDataSource {
  final ApiClient apiClient;

  TicketRemoteDataSourceImpl(this.apiClient);
  @override
  Future<List<Ticket>> fetchTicket() async {
    try {
      final response = await apiClient.fetchTicket();
      final List<dynamic> responseData = json.decode(response.body)['data'];
      final List<Ticket> tickets = responseData.map((json) {
        return Ticket.fromJson(json);
      }).toList();
      return tickets;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
