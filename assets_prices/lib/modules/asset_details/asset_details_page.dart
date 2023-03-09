import 'package:assets_prices/channel/platform_channel.dart';
import 'package:assets_prices/modules/asset_details/cubit/asset_details_cubit.dart';
import 'package:assets_prices/modules/asset_details/widgets/chart_minus_day_one.dart';
import 'package:assets_prices/modules/asset_details/widgets/variation_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class AssetDetailsPage extends StatefulWidget {
  const AssetDetailsPage({super.key});

  @override
  State<AssetDetailsPage> createState() => _AssetDetailsPageState();
}

class _AssetDetailsPageState extends State<AssetDetailsPage> {
  final cubit = GetIt.instance.get<AssetDetailsCubit>();

  var receivedSymbol = 'BBAS3.SA';

  @override
  void initState() {
    super.initState();
    cubit.getFinancialAsset(receivedSymbol);
    getReceivedMessage();
  }

  getReceivedMessage() {
    channel.setMethodCallHandler((call) async {
      if (call.method == 'sendSymbol') {
        receiveString(call.arguments);
        setState(() {
          receivedSymbol = call.arguments;
        });
        cubit.getFinancialAsset(receivedSymbol);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AssetDetailsCubit, AssetDetailsState>(
        bloc: cubit,
        listener: (context, state) {
          if (state.status == AssetDetailsStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Error'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == AssetDetailsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == AssetDetailsStatus.loaded) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Text(
                        state.financialAsset?.meta.symbol ?? 'Error',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:
                          Text('Tabela variação do valor ultimos 30 pregões'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: VariationTable(
                        financialAsset: state.financialAsset!,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:
                          Text('Grafico variação do valor ultimos 30 pregões'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ChartMinusDayOne(
                      financialAsset: state.financialAsset!,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            );
          }

          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
