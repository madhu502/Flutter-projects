import 'package:first_app/model/item_model.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Item> lstItem = [
    Item(itemId: 1, itemName: 'Bag', itemPrice: '240'),
    Item(itemId: 2, itemName: 'Copy', itemPrice: '87'),
    Item(itemId: 3, itemName: 'Book', itemPrice: '322'),
    Item(itemId: 4, itemName: 'Pen', itemPrice: '222'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DataTable(
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.amber),
          border: TableBorder.all(color: Colors.black),
          columns: const [
            DataColumn(
              label: Text('SN'),
            ),
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Price'),
            ),
            DataColumn(
              label: Text('Edit'),
            ),
          ],
          rows: lstItem.map((item) {
            return DataRow(cells: [
              DataCell(Text(item.itemId.toString())),
              DataCell(Text(item.itemName)),
              DataCell(Text(item.itemPrice)),
              DataCell(
                const Icon(Icons.delete),
                onTap: () {},
              )
            ]);
          }).toList()),
    );
  }
}
