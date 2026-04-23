import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_app/data/datasource/stocklist_local_data_source.dart';
import 'package:trade_app/data/repositories/stocklist_impl_repository.dart';
import 'package:trade_app/domain/usecases/get_stocklist.dart';
import 'package:trade_app/presentation/bloc/stocklist_bloc.dart';
import 'package:trade_app/presentation/bloc/stocklist_event.dart';
import 'package:trade_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StocklistBloc(
        //pass usecase
        GetStocklist(StocklistImplRepository(StocklistLocalDataSource())),
      )..add(FetchStocklistEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const HomeScreen(),
      ),
    );
  }
}
