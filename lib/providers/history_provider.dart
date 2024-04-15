import 'package:dgtix_app/domain/entities/ticket.dart';
import 'package:dgtix_app/presentation/navigation/navigation_service.dart';
import 'package:dgtix_app/presentation/navigation/routes.dart';
import 'package:flutter/material.dart';

class HistoryProvider with ChangeNotifier {
  List<Ticket> _history = [];
  List<Ticket> get histories => _history;

  void addTicketToHistory(Ticket ticket) {
    _history.add(ticket);
    NavigationService().navigateTo(Routes.successPaymentScreen);

    notifyListeners();
  }
}
