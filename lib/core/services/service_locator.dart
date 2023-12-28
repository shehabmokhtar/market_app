import 'package:get_it/get_it.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerSingleton<AuthanticationCubit>(AuthanticationCubit());
  }
}
