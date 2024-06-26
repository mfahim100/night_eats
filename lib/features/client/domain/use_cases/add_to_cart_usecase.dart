import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/use_cases.dart';

import '../../../../core/utils/failure.dart';
import '../repositries/client_repository.dart';

class AddToCartUseCase implements UseCase{


  final ClientRepository clientRepository;


  AddToCartUseCase({required this.clientRepository});


  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await clientRepository.addToCart(params.data);
  }







}