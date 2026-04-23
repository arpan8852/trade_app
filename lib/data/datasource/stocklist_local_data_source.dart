import 'package:trade_app/data/models/stocklist_model.dart';

class StocklistLocalDataSource {
  //method for call stocklist from local
  List<StocklistModel> getStocksList() {
    return const [
      StocklistModel(
        stockName: "RELIANCE",
        stockType: "NSE | EQ",
        investedAmount: 1374.10,
        profitLossAmount: 4.40,
        profitLossPercentage: 0.32,
        isLoss: true,
      ),
      StocklistModel(
        stockName: "HDFCBANK",
        stockType: "NSE | EQ",
        investedAmount: 966.95,
        profitLossAmount: 0.95,
        profitLossPercentage: 0.10,
      ),
      StocklistModel(
        stockName: "ASIANPAINT",
        stockType: "NSE | EQ",
        investedAmount: 2537.40,
        profitLossAmount: 6.60,
        profitLossPercentage: 0.26,
      ),
      StocklistModel(
        stockName: "NIFTY IT",
        stockType: "IDX",
        investedAmount: 35184.30,
        profitLossAmount: 837.86,
        profitLossPercentage: 2.55,
      ),
      StocklistModel(
        stockName: "RELIANCE SEP 1880 CE",
        stockType: "NSE | Monthly ",
        investedAmount: 0.00,
        profitLossAmount: 0.00,
        profitLossPercentage: 0.00,
      ),
      StocklistModel(
        stockName: "RELIANCE SEP 1370 pE",
        stockType: "NSE | Monthly ",
        investedAmount: 19.20,
        profitLossAmount: 1.00,
        profitLossPercentage: 5.49,
      ),
      StocklistModel(
        stockName: "MRF",
        stockType: "NSE | EQ",
        investedAmount: 147625.00,
        profitLossAmount: 550.00,
        profitLossPercentage: 0.37,
      ),
      StocklistModel(
        stockName: "MRF",
        stockType: "NSE | EQ",
        investedAmount: 147439.45,
        profitLossAmount: 463.80,
        profitLossPercentage: 0.32,
      ),
    ];
  }
}
