import 'package:flutter/material.dart';

class ReoderableStocklistWidget<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(T item, int index) itemBuilder;
  final void Function(int oldIndex, int newIndex)? onReorderList;
  const ReoderableStocklistWidget({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.onReorderList,
  });

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: items.length,
      onReorder: onReorderList ?? (_, _) {},
      itemBuilder: (context, index) {
          final item = items[index];
          return Container(
          key: ValueKey(item), // ✅ FIXED
          
          child: itemBuilder(item, index),
        );
        
        
         
      },
    );
  }
}
