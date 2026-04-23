class HighlightedStockModel {
  final String stockName;
  final String stockType;
  final bool isStockType;
  final double investedAmount;
  final double profitLossAmount;
  final double profitLossPercentage;
  final bool isLoss;

  HighlightedStockModel({
    required this.stockName,
    required this.stockType,
    required this.investedAmount,
    required this.profitLossAmount,
    required this.profitLossPercentage,
    this.isStockType = false,
    this.isLoss = false,
  });
}
