import 'package:assets_prices/modules/asset_details/cubit/asset_details_cubit.dart';
import 'package:assets_prices/services/yahoo_finance_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

configureDependencies() {
  //Cubits
  getIt.registerLazySingleton(() => AssetDetailsCubit(getIt()));

  //Services
  getIt.registerLazySingleton<YahooFinanceService>(() => YahooFinanceService());
}
