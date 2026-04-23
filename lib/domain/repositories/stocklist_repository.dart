import 'package:trade_app/data/models/stocklist_model.dart';

abstract class StocklistRepository {
  //abstract method for get stocklist 
  List<StocklistModel> getStocksList();
}