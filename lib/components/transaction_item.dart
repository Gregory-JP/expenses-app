import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

@override
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 4,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${tr.value.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? TextButton.icon(
                onPressed: () => onRemove(tr.id),
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).errorColor,
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Colors.red[400],
                onPressed: () => onRemove(tr.id),
              ),
      ),
    );
  }
}
