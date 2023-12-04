import 'package:flutter/material.dart';
import 'package:sample1/models/category.dart';
import 'package:sample1/screens/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  @override
  Widget build(BuildContext context) {
    // void onAddClicked{};
    Widget content = Center(child: Text('No items'));

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: Key(_groceryItems[index].id),
          child: ListTile(
            title: Text(_groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _groceryItems[index].category2.color,
            ),
            trailing: Text(_groceryItems[index].quantity.toString()),
          ),
          onDismissed: (direction) {
            setState(() {
              _groceryItems.remove(_groceryItems[index]);
            });
          },
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Grocieres"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              print('pressed+++');
              // Navigator.of(context).push<GroceryItem>(
              //   MaterialPageRoute(
              //     builder: (ctx) => const NewItem(),
              //   ),
              // );
              _addItem(context);
              // print('pressed+++ after');
            },
          )
        ],
      ),
      body: content,
    );
  }

  void _addItem(BuildContext context) async {
    print('in ADD ++');
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    ); // Navigator.push(context, route)
    if (newItem == null) return;
    setState(() {
      _groceryItems.add(newItem);
    });
  }
}
