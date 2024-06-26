import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';
import 'package:night_eats/features/admin/main_admin/domain/repositories/admin_repository.dart';

class DeleteItemUseCase implements UseCase{

  AdminRepository adminRepository;

  DeleteItemUseCase({required this.adminRepository});


  @override
  Future<Either<Failure, dynamic>> call(params) async {
    return await adminRepository.deleteItem(params.data);

  }



}