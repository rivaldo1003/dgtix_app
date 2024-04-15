import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/domain/usecases/get_ticket_use_case.dart';
import 'package:flutter/material.dart';

class TicketProvider with ChangeNotifier {
  final GetTicketUseCase _getTicketUseCase;

  TicketProvider({
    required GetTicketUseCase getTicketUseCase,
  }) : _getTicketUseCase = getTicketUseCase;

  List<Ticket> _tickets = [];

  List<Ticket> get tickets => _tickets;
}
