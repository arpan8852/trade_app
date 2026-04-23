import 'package:trade_app/data/datasource/stocklist_local_data_source.dart';
import 'package:trade_app/data/models/stocklist_model.dart';
import 'package:trade_app/domain/repositories/stocklist_repository.dart';

class StocklistImplRepository implements StocklistRepository {
  final StocklistLocalDataSource localDataSource;

  StocklistImplRepository(this.localDataSource);
  
  //fetching data from locally saved data
  @override
  List<StocklistModel> getStocksList() {
   return localDataSource.getStocksList();
  }
}
