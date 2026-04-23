import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_app/domain/usecases/get_stocklist.dart';
import 'package:trade_app/presentation/bloc/stocklist_event.dart';
import 'package:trade_app/presentation/bloc/stocklist_state.dart';

class StocklistBloc extends Bloc<StocklistEvent, StocklistState> {
  final GetStocklist getStocklist;

  StocklistBloc(this.getStocklist) : super(const StocklistState()) {
    on<FetchStocklistEvent>(_onFetchStocklist);
    on<ChangeWatchlistEvent>(_onChangeWatchlist);

    on<ReorderStockListEvent>(_onReorderStockList);

    on<DeleteStockEvent>(_onDeleteStockEvent);
  }

  //fetch stocklist
  void _onFetchStocklist(
    FetchStocklistEvent event,
    Emitter<StocklistState> emit,
  ) {
    emit(state.copywith(isLoading: true));

    var stockList = getStocklist();
    emit(state.copywith(stockList: stockList, isLoading: false));
  }

  //select watchlist
  void _onChangeWatchlist(
    ChangeWatchlistEvent event,
    Emitter<StocklistState> emit,
  ) {
    emit(state.copywith(selectedIndex: event.index));
  }

  //reorder stocklist
  void _onReorderStockList(
    ReorderStockListEvent event,
    Emitter<StocklistState> emit,
  ) {
    final updatedList = List.of(state.stockList);

    int newIndex = event.newIndex;

    if (newIndex > event.oldIndex) {
      newIndex -= 1;
    }

    final item = updatedList.removeAt(event.oldIndex);

    updatedList.insert(newIndex, item);

    emit(state.copywith(stockList: updatedList));
  }

  //delete from stocklist
  void _onDeleteStockEvent(
    DeleteStockEvent event,
    Emitter<StocklistState> emit,
  ) {
    final updatedList = List.of(state.stockList);
    updatedList.removeAt(event.index);
    emit(state.copywith(stockList: updatedList));
  }
}
