abstract class StocklistEvent {}

//event for fetching stock
class FetchStocklistEvent extends StocklistEvent {}

//event for change watchlist
class ChangeWatchlistEvent extends StocklistEvent {
  final int index;
  ChangeWatchlistEvent(this.index);
}

//event for reorder list
class ReorderStockListEvent extends StocklistEvent {
  final int oldIndex;
  final int newIndex;

  ReorderStockListEvent(this.oldIndex, this.newIndex);
}
//event for delete item from list
class DeleteStockEvent extends StocklistEvent {
  final int index;
  DeleteStockEvent(this.index);
}