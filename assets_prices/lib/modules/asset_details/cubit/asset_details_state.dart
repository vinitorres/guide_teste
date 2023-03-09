part of 'asset_details_cubit.dart';

enum AssetDetailsStatus { initial, loading, loaded, error }

class AssetDetailsState extends Equatable {
  final AssetDetailsStatus status;
  final FinancialAsset? financialAsset;

  final String? errorMessage;

  AssetDetailsState({
    required this.status,
    this.financialAsset,
    this.errorMessage,
  });

  @override
  List<Object> get props => [this.status];

  AssetDetailsState copyWith({
    AssetDetailsStatus? status,
    FinancialAsset? financialAsset,
    String? errorMessage,
  }) {
    return AssetDetailsState(
      status: status ?? this.status,
      financialAsset: financialAsset ?? this.financialAsset,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
