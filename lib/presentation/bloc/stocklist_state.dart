import 'package:trade_app/data/models/stocklist_model.dart';

class StocklistState {
  final List<StocklistModel> stockList;

  final int selectedIndex;

  final bool isLoading;

  final int selectedNavIndex;

  final List<String> watchlists;
  //initial state
  const StocklistState({
    this.stockList = const [],
    this.isLoading = false,
    this.selectedIndex = 0,
    this.selectedNavIndex = 0,
    this.watchlists = const ["Watchlist 1", "Watchlist 5", "Watchlist 6"],
  });

  StocklistState copywith({
    List<StocklistModel>? stockList,
    int? selectedIndex,
    bool? isLoading,
    int? selectedNavIndex,
     List<String>? watchlists,
  }) {
    return StocklistState(
      selectedNavIndex: selectedNavIndex ?? this.selectedNavIndex,
      isLoading: isLoading ?? this.isLoading,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      stockList: stockList ?? this.stockList,
        watchlists: watchlists ?? this.watchlists,
    );
  }
}
