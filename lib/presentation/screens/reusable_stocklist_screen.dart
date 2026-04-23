import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_app/presentation/bloc/stocklist_bloc.dart';
import 'package:trade_app/presentation/bloc/stocklist_event.dart';
import 'package:trade_app/presentation/bloc/stocklist_state.dart';
import 'package:trade_app/presentation/widgets/edit_stocklist_widget.dart';
import 'package:trade_app/presentation/widgets/reoderable_stocklist_widget.dart';

class ReusableStocklistScreen extends StatelessWidget {
  const ReusableStocklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),

          title: const Text("Edit Watchlist 1"),
        ),
        body: BlocBuilder<StocklistBloc, StocklistState>(
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 6,
                          offset: const Offset(0, 2), // subtle bottom shadow
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'Watchlist 1',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReoderableStocklistWidget(
                    itemBuilder: (item, index) {
                      return EditStocklistWidget(
                        stocklistModel: item,
                        onDelete: () {
                          context.read<StocklistBloc>().add(
                            DeleteStockEvent(index),
                          );
                        },
                      );
                    },
                    items: state.stockList,
                    onReorderList: (oldIndex, newIndex) {
                      context.read<StocklistBloc>().add(
                        ReorderStockListEvent(oldIndex, newIndex),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
