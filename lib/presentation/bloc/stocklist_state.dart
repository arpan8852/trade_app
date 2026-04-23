import 'package:trade_app/data/models/stocklist_model.dart';

class StocklistState {
  final List<StocklistModel> stockList;

  final int selectedIndex;

  final bool isLoading;
  //initial state
  const StocklistState({
    this.stockList = const [],
    this.isLoading = false,
    this.selectedIndex = 0,
  });

  StocklistState copywith({
    List<StocklistModel>? stockList,
    int? selectedIndex,
    bool? isLoading,
  }) {
    return StocklistState(
      isLoading: isLoading ?? this.isLoading,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      stockList: stockList ?? this.stockList,
    );
  }
}
