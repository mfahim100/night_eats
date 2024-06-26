import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../repositries/client_repository.dart';

class ClientGetDeliveredOrdersUseCase implements UseCase {




  final ClientRepository clientRepository;

  ClientGetDeliveredOrdersUseCase({required this.clientRepository});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await clientRepository.clientGetDeliveredOrders();
  }






}