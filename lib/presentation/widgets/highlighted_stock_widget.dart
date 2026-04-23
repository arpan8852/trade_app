import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trade_app/data/models/highlighted_stock_model.dart'; 

class HighlightedStockWidget extends StatelessWidget {
  final HighlightedStockModel highlightedStockModel;

  const HighlightedStockWidget({
    super.key,
    required this.highlightedStockModel,
  });

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('#,##0.00');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                highlightedStockModel.stockName,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14, // reduced for small screens
                ),
              ),
            ),
            highlightedStockModel.isStockType
                ? Text(
                    highlightedStockModel.stockType,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  )
                : Container(),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Text(
                formatter.format(highlightedStockModel.investedAmount),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            Text(
              highlightedStockModel.isLoss
                  ? "-${formatter.format(highlightedStockModel.profitLossAmount)} (${highlightedStockModel.profitLossPercentage.toStringAsFixed(2)}%)"
                  : "${formatter.format(highlightedStockModel.profitLossAmount)} (${highlightedStockModel.profitLossPercentage.toStringAsFixed(2)}%)",

              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: highlightedStockModel.isLoss ? Colors.red : Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
