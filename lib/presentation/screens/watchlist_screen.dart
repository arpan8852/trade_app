import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_app/data/models/highlighted_stock_model.dart';
import 'package:trade_app/presentation/bloc/stocklist_bloc.dart';
import 'package:trade_app/presentation/bloc/stocklist_event.dart';
import 'package:trade_app/presentation/bloc/stocklist_state.dart';
import 'package:trade_app/presentation/screens/reusable_stocklist_screen.dart';
import 'package:trade_app/presentation/widgets/highlighted_stock_widget.dart';
import 'package:trade_app/presentation/widgets/stock_list_widget.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //highlighted stocks widget
        _highlightedStock(),
        //search stock textfield
        _searchStock(),
        //select watchlist based on index
        _tabsSection(),
        //filter button
        _filterButton(context),
        //scrollable stock list
        Expanded(child: _stockList()),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _highlightedStock() {
    return Container(
      // margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        // color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: HighlightedStockWidget(
              highlightedStockModel: HighlightedStockModel(
                stockName: "SENSEX 18TH SEP",
                stockType: "BSE",
                investedAmount: 1225.55,
                profitLossAmount: 144.50,
                profitLossPercentage: 13.3,
                isStockType: true,
              ),
            ),
          ),
          const SizedBox(width: 10),

          Container(height: 60, width: 1, color: Colors.grey.shade400),

          const SizedBox(width: 10),
          Expanded(
            child: HighlightedStockWidget(
              highlightedStockModel: HighlightedStockModel(
                stockName: "NIFTY BANK",
                stockType: "",
                investedAmount: 54172.85,
                profitLossAmount: 14.05,
                profitLossPercentage: 0.03,
                isLoss: true,
                isStockType: true,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _searchStock() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
          children: [
            const SizedBox(width: 12),
            Icon(Icons.search, size: 18, color: Colors.grey.shade500),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Search for instruments",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 13,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabsSection() {
    return BlocBuilder<StocklistBloc, StocklistState>(
      builder: (context, state) {
        final watchlists = state.watchlists;
        return SizedBox(
          height: 35,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(height: 1, color: Colors.grey.shade300),
              ),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                itemCount: watchlists.length,
                itemBuilder: (context, index) {
                  final isSelected = state.selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      context.read<StocklistBloc>().add(
                        ChangeWatchlistEvent(index),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            watchlists[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: isSelected ? Colors.black : Colors.grey,
                            ),
                          ),

                          const SizedBox(height: 6),
                          Container(
                            height: 2,
                            width: isSelected ? 70 : 0,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _filterButton(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey.shade300,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ReusableStocklistScreen(),
                  ),
                );
              },

              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.sort),
                  SizedBox(width: 5),
                  Text("Sort by"),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _stockList() {
    return BlocBuilder<StocklistBloc, StocklistState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state.selectedIndex == 0) {
          return ListView.builder(
            itemCount: state.stockList.length,
            itemBuilder: (context, index) {
              return StockListWidget(stocklistModel: state.stockList[index]);
            },
          );
        } else if (state.selectedIndex == 1) {
          return const Center(
            child: Text("watchlist 5 data will add in future"),
          );
        } else {
          return const Center(
            child: Text("watchlist 6 data will add in future"),
          );
        }
      },
    );
  }
}
