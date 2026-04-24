import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_app/presentation/bloc/stocklist_bloc.dart';
import 'package:trade_app/presentation/bloc/stocklist_event.dart';
import 'package:trade_app/presentation/bloc/stocklist_state.dart';
import 'package:trade_app/presentation/screens/funds_screen.dart';
import 'package:trade_app/presentation/screens/gtt_screen.dart';
import 'package:trade_app/presentation/screens/order_screen.dart';
import 'package:trade_app/presentation/screens/portfolio_screen.dart';
import 'package:trade_app/presentation/screens/profile_screen.dart';
import 'package:trade_app/presentation/screens/watchlist_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Widget> pages = const [
    WatchlistScreen(),
    OrderScreen(),
    GttScreen(),
    PortfolioScreen(),
    FundsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StocklistBloc, StocklistState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xFFF5F5F5),
            body: pages[state.selectedNavIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedNavIndex,
              onTap: (index) {
                context.read<StocklistBloc>().add(BottomNavChangeEvent(index));
              },

              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,

              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark_border),
                  activeIcon: Icon(Icons.bookmark),
                  label: "Watchlist",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long_outlined),
                  activeIcon: Icon(Icons.receipt_long),
                  label: "Orders",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.track_changes_outlined),
                  activeIcon: Icon(Icons.track_changes),
                  label: "GTT",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.work_outline),
                  activeIcon: Icon(Icons.work),
                  label: "Portfolio",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  activeIcon: Icon(Icons.account_balance_wallet),
                  label: "Funds",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
