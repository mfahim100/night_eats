import 'package:dartz/dartz.dart';
import 'package:night_eats/core/utils/failure.dart';
import 'package:night_eats/core/utils/use_cases.dart';
import 'package:night_eats/features/admin/main_admin/domain/repositories/admin_repository.dart';

class AddNewItemUseCase implements UseCase{



 final AdminRepository adminRepository;

 AddNewItemUseCase({required this.adminRepository});

  @override
  Future<Either<Failure, dynamic>> call(params) async {
   return await adminRepository.addNewItem(params.data);
  }





}