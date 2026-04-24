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
          title: BlocBuilder<StocklistBloc, StocklistState>(
            builder: (context, state) {
              return Text("Edit ${state.watchlists[state.selectedIndex]}");
            },
          ),
          // title: const Text("Edit Watchlist 1"),
        ),
        body: BlocBuilder<StocklistBloc, StocklistState>(
          builder: (context, state) {
            if (state.selectedIndex == 0) {
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
            } else if (state.selectedIndex == 1) {
              return const Center(child: Text("No data yet on Watchlist 5"));
            } else {
              return const Center(child: Text("No data yet on Watchlist 6"));
            }
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  debugPrint("edit watchlist btn tapped");
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(child: Text("Edit other watchlists")),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  debugPrint("edit watchlist btn tapped");
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Save watchlists",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
