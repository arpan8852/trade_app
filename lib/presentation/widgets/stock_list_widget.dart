import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trade_app/data/models/stocklist_model.dart'; 

class StockListWidget extends StatelessWidget {
  final StocklistModel stocklistModel;
  const StockListWidget({super.key, required this.stocklistModel});

  @override
  Widget build(BuildContext context) {
    final model = stocklistModel;
    final formatter = NumberFormat('#,##0.00');
    return Column(
      children: [
        Divider(thickness: 1, height: 1, color: Colors.grey.shade300),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  model.stockName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          
              Text(
                formatter.format(model.investedAmount),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: model.isLoss ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
        ), 
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        
          child: Row(
            children: [
              Expanded(
                child: Text(
                  model.stockType,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ),
              Text(
                model.isLoss
                    ? "-${formatter.format(model.profitLossAmount)} (${model.profitLossPercentage.toStringAsFixed(2)}%)"
                    : "${formatter.format(model.profitLossAmount)} (${model.profitLossPercentage.toStringAsFixed(2)}%)",
                style: const TextStyle(
                  fontSize: 12,
                 
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
