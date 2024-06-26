import 'package:get_it/get_it.dart';
import 'package:night_eats/core/controllers/home_controller.dart';
import 'package:night_eats/features/admin/main_admin/data/data_sources/admin_database_impl.dart';
import 'package:night_eats/features/admin/main_admin/data/data_sources/admin_database_main.dart';
import 'package:night_eats/features/admin/main_admin/data/repositories/admin_repo_impl.dart';
import 'package:night_eats/features/admin/main_admin/domain/repositories/admin_repository.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/add_new_item_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/admin_get_user_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/delete_item_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_all_delivery_boy_usecase.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_all_orders_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_deliveredorders_usecase.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_my_items_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_onthewayorder_usecase.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/get_rejectedorder_usecase.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/update_item_use_case.dart';
import 'package:night_eats/features/admin/main_admin/domain/use_cases/update_status_usecase.dart';
import 'package:night_eats/features/admin/main_admin/presentation/manager/admin_controller.dart';
import 'package:night_eats/features/auth/data/data_source/database_impl.dart';
import 'package:night_eats/features/auth/data/data_source/database_main.dart';
import 'package:night_eats/features/auth/data/repositries/auth_repo_iml.dart';
import 'package:night_eats/features/auth/domain/repositries/auth_repository.dart';
import 'package:night_eats/features/auth/domain/use_cases/forgot_password_use_case.dart';
import 'package:night_eats/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:night_eats/features/auth/domain/use_cases/login_use_case.dart';
import 'package:night_eats/features/auth/domain/use_cases/update_user_picture_usecase.dart';
import 'package:night_eats/features/client/domain/repositries/client_repository.dart';
import 'package:night_eats/features/client/domain/use_cases/add_client_order_use_case.dart';
import 'package:night_eats/features/client/domain/use_cases/add_to_cart_usecase.dart';
import 'package:night_eats/features/client/domain/use_cases/client_get_all_cartdata_usecase.dart';
import 'package:night_eats/features/client/domain/use_cases/client_get_all_orders_use_case.dart';
import 'package:night_eats/features/client/domain/use_cases/client_get_deliveredorders_usecase.dart';
import 'package:night_eats/features/client/domain/use_cases/client_get_my_items_use_case.dart';
import 'package:night_eats/features/client/domain/use_cases/client_get_onthewayorder_usecase.dart';
import 'package:night_eats/features/client/domain/use_cases/client_get_rejectedorder_usecase.dart';
import 'package:night_eats/features/client/domain/use_cases/delete_cartdata_udecase.dart';
import 'package:night_eats/features/client/presentation/manager/client_controller.dart';
import 'package:night_eats/features/delivery/data/data_repositries/delivery_repo_impl.dart';
import 'package:night_eats/features/delivery/data/data_source/delivery_database_impl.dart';
import 'package:night_eats/features/delivery/data/data_source/delivery_database_main.dart';
import 'package:night_eats/features/delivery/domain/reposiries/delivery_repository.dart';
import 'package:night_eats/features/delivery/domain/use_cases/delivery_get_all_orders_use_case.dart';
import 'package:night_eats/features/delivery/domain/use_cases/delivery_get_deliveredorders_usecase.dart';
import 'package:night_eats/features/delivery/domain/use_cases/delivery_get_onthewayorder_usecase.dart';
import 'package:night_eats/features/delivery/domain/use_cases/delivery_get_rejectedorder_usecase.dart';
import 'package:night_eats/features/delivery/presentation/manager/deliver_controller.dart';
import '../../features/auth/domain/use_cases/register_use_case.dart';
import '../../features/auth/presentation/manager/auth_controller.dart';
import '../../features/client/data/data_repository/client_repo_impl.dart';
import '../../features/client/data/data_source/client_database_impl.dart';
import '../../features/client/data/data_source/client_database_main.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Controller
  sl.registerLazySingleton(() => HomeController());


  ///AuthController
  sl.registerLazySingleton(() => AuthController(
      registerUserUseCase: sl(),
      loginUseCase: sl(),
      forgotPasswordUseCase: sl(),
      getUserUseCase: sl(),
      updateUserPictureUseCase: sl()));

  ///Admin Controller
  sl.registerLazySingleton(() => AdminController(
        addNewItemUseCase: sl(),
        getMyItemsUseCase: sl(),
        deleteItemUseCase: sl(),
        updateItemUseCase: sl(),
        getAllOrdersUseCase: sl(),
        getOnTheWayOrderUseCase: sl(),
    getRejectedOrderUseCase: sl(),
    getDeliveredOrdersUseCase: sl(),
    updateStatusUseCase: sl(),
    adminGetUserUseCase: sl(),
    getAllDeliveryBoyUseCase: sl(),
      ));

  ///Client Controller
  sl.registerLazySingleton(
      () => ClientController(
        addClientController: sl(),
        getUserUseCase: sl(),
        clientGetAllOrdersUseCase: sl(),
        clientGetOnTheWayOrderUseCase: sl(),
        clientGetRejectedOrderUseCase: sl(),
        clientGetDeliveredOrdersUseCase: sl(),
        clientGetMyItemsUseCase: sl(),
        addToCartUseCase: sl(),
        clientGetAllCartDataUseCase: sl(),
        deleteCartDataUseCase: sl(),
      ));

  ///DeliveryController
  sl.registerLazySingleton(
          () => DeliveryController(
            getAllOrdersUseCase: sl(),
            getOnTheWayOrderUseCase: sl(),
            getRejectedOrderUseCase: sl(),
            getDeliveredOrdersUseCase: sl(),
            updateStatusUseCase: sl(),
      ));

  //UseCases
  sl.registerLazySingleton(() => RegisterUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => GetUserUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => UpdateUserPictureUseCase(authRepository: sl()));

  ///Admin Use Cases
  sl.registerLazySingleton(() => AddNewItemUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => GetMyItemsUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => DeleteItemUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => UpdateItemUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => GetAllOrdersUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => GetOnTheWayOrderUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => GetRejectedOrderUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => GetDeliveredOrdersUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => UpdateStatusUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => AdminGetUserUseCase(adminRepository: sl()));
  sl.registerLazySingleton(() => GetAllDeliveryBoyUseCase(adminRepository: sl()));

  ///client Use Cases
  sl.registerLazySingleton(() => AddClientOrderUseCase(clientRepository: sl()));
  sl.registerLazySingleton(() => ClientGetAllOrdersUseCase(clientRepository: sl()));
  sl.registerLazySingleton(() => ClientGetOnTheWayOrderUseCase(clientRepository: sl()));
  sl.registerLazySingleton(() => ClientGetRejectedOrderUseCase(clientRepository: sl()));
  sl.registerLazySingleton(() => ClientGetDeliveredOrdersUseCase(clientRepository: sl()));
  sl.registerLazySingleton(() => ClientGetMyItemsUseCase(clientRepository: sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(clientRepository: sl()));
  sl.registerLazySingleton(() =>  ClientGetAllCartDataUseCase(clientRepository: sl()));
  sl.registerLazySingleton(() =>  DeleteCartDataUseCase(clientRepository: sl()));


  ///Delivery App USe case
  sl.registerLazySingleton(() => DeliveryGetAllOrdersUseCase(deliveryRepository: sl()));
  sl.registerLazySingleton(() => DeliveryGetOnTheWayOrderUseCase(deliveryRepository: sl()));
  sl.registerLazySingleton(() => DeliveryGetRejectedOrderUseCase(deliveryRepository: sl()));
  sl.registerLazySingleton(() => DeliveryGetDeliveredOrdersUseCase(deliveryRepository: sl()));


  ///Repos
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepoIml(databaseMain: sl()));

  sl.registerLazySingleton<AdminRepository>(
      () => AdminRepoImpl(adminDatabaseMain: sl()));

  sl.registerLazySingleton<ClientRepository>(
      () => ClientRepoImpl(clientDatabaseMain: sl()));

  sl.registerLazySingleton<DeliveryRepository>(()=>DeliveryRepoImpl(deliveryDatabaseMain: sl()));

  ///Database
  sl.registerLazySingleton<DatabaseMain>(() => DatabaseImpl());
  sl.registerLazySingleton<AdminDatabaseMain>(() => AdminDatabaseImpl());
  sl.registerLazySingleton<ClientDatabaseMain>(() => ClientDatabaseImpl());
  sl.registerLazySingleton<DeliveryDatabaseMain>(() => DeliveryDatabaseImpl());


  // String uid = FirebaseAuth.instance.currentUser!.uid;

  ///Initials
  sl<AuthController>().getCurrentUser();
  // sl<AuthController>().getPermission();
  sl<AdminController>().getOnTheWayOrder();
  sl<AdminController>().loadAdminData();
  sl<ClientController>().loadClientData();
  sl<DeliveryController>().loadDeliveryData();




}
