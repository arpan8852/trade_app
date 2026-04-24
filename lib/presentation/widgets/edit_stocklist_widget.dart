import 'package:flutter/material.dart';
import 'package:trade_app/data/models/stocklist_model.dart';

class EditStocklistWidget extends StatelessWidget {
  final StocklistModel stocklistModel;
  final VoidCallback onDelete;
  const EditStocklistWidget({
    super.key,
    required this.stocklistModel,
    required this.onDelete,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.drag_handle),
                  const SizedBox(width: 10),
                  Text(
                    stocklistModel.stockName,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              IconButton(icon: const Icon(Icons.delete), onPressed: onDelete),
            ],
          ),
        ),

        Divider(thickness: 1, height: 1, color: Colors.grey.shade300),
      ],
    );
  }
}
