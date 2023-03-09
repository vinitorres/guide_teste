import 'package:assets_prices/models/financial_asset.dart';
import 'package:assets_prices/services/yahoo_finance_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'asset_details_state.dart';

class AssetDetailsCubit extends Cubit<AssetDetailsState> {
  AssetDetailsCubit(this.yahooFinanceService)
      : super(AssetDetailsState(status: AssetDetailsStatus.initial));

  final YahooFinanceService yahooFinanceService;

  void getFinancialAsset(String symbol) async {
    emit(AssetDetailsState(status: AssetDetailsStatus.loading));
    try {
      final financialAsset =
          await YahooFinanceService().getFinancialAsset(symbol);

      emit(AssetDetailsState(
          status: AssetDetailsStatus.loaded, financialAsset: financialAsset));
    } catch (e, s) {
      emit(AssetDetailsState(
          status: AssetDetailsStatus.error,
          errorMessage: e.toString() + s.toString()));
    }
  }
}
