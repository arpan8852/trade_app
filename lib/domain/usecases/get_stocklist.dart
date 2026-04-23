import 'package:trade_app/data/models/stocklist_model.dart';
import 'package:trade_app/domain/repositories/stocklist_repository.dart';

class GetStocklist {
  //fetch data from domain layer repository

  //create instance of  domain layer repository


  final StocklistRepository repository;

  const GetStocklist(this.repository);

  //method for fetching data from repository

  List<StocklistModel> call(){
    return repository.getStocksList();
  }

}