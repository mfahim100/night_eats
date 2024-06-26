import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';
import 'package:night_eats/features/client/domain/repositries/client_repository.dart';


class ClientGetMyItemsUseCase implements UseCase{


  final ClientRepository clientRepository;

  ClientGetMyItemsUseCase({required this.clientRepository});
  @override


  Future<Either<Failure, dynamic>> call(params) async {
    return await clientRepository.clientGetMyItem(params.data);
  }




}