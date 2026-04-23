class StocklistModel {
  final String stockName;
  final double investedAmount;
  final String stockType;
  final double profitLossAmount;
  final double profitLossPercentage;
  final bool isLoss ;

  
   const StocklistModel({ 
    required this.stockName,
    required this.investedAmount,
    required this.stockType,
    required this.profitLossAmount,
    required this.profitLossPercentage,
    this.isLoss = false,
  });
}