import 'package:dgtix_app/core/utils/api_client.dart';
import 'package:dgtix_app/data/datasource/auth_remote_data_source.dart';
import 'package:dgtix_app/data/datasource/ticket_remote_data_source.dart';
import 'package:dgtix_app/data/repositories/auth_repositories_impl.dart';
import 'package:dgtix_app/data/repositories/ticket_repositories_impl.dart';
import 'package:dgtix_app/domain/repositories/auth_repository.dart';
import 'package:dgtix_app/domain/repositories/ticket_repository.dart';
import 'package:dgtix_app/domain/usecases/get_auth_use_case.dart';
import 'package:dgtix_app/domain/usecases/get_ticket_use_case.dart';
import 'package:dgtix_app/providers/auth_provider.dart';
import 'package:dgtix_app/providers/history_provider.dart';
import 'package:dgtix_app/providers/ticket_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

final apiClientProvider = Provider<ApiClient>(
  create: (context) {
    return ApiClient(httpClient: http.Client());
  },
);

// TICKET EVENT
final ticketRemoteDataSourceProvider = Provider<TicketRemoteDataSource>(
  create: (context) {
    return TicketRemoteDataSourceImpl(
      context.read<ApiClient>(),
    );
  },
);

final ticketRepositoryProvider = Provider<TicketRepository>(
  create: (context) {
    return TicketRepositoryImpl(
      ticketRemoteDataSource: context.read<TicketRemoteDataSource>(),
    );
  },
);

final getTicketUsecaseProvider = Provider<GetTicketUseCase>(
  create: (context) {
    return GetTicketUseCase(
      ticketRepository: context.read<TicketRepository>(),
    );
  },
);

final ticketProvider = ChangeNotifierProvider<TicketProvider>(
  create: (context) {
    return TicketProvider(
        getTicketUseCase: GetTicketUseCase(
      ticketRepository: context.read<TicketRepository>(),
    ));
  },
);
// AUTH
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  create: (context) {
    return AuthRemoteDataSourceImpl(
      context.read<ApiClient>(),
    );
  },
);

final authRepositoryProvider = Provider<AuthRepository>(
  create: (context) {
    return AuthRepositoryImpl(
      authRemoteDataSource: context.read<AuthRemoteDataSource>(),
    );
  },
);
final getAuthUseCaseProvider = Provider<GetAuthUseCase>(
  create: (context) {
    return GetAuthUseCase(
      authRepository: context.read<AuthRepository>(),
    );
  },
);

final authProvider = ChangeNotifierProvider<AuthProvider>(
  create: (context) {
    return AuthProvider(
      getAuthUseCase: GetAuthUseCase(
        authRepository: context.read<AuthRepository>(),
      ),
    );
  },
);
final historyProvider = ChangeNotifierProvider<HistoryProvider>(
  create: (context) {
    return HistoryProvider();
  },
);
