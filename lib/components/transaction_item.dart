import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
 

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemoveTransaction,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onRemoveTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${tr.value}'),
            ),
          ),
        ),
        title: Text(
          tr.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(tr.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
        ? TextButton.icon(
          icon: const Icon(Icons.delete),
          label: const Text('Excluir'),
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          onPressed: () => onRemoveTransaction(tr.id),
        )
        : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => onRemoveTransaction(tr.id),
          ),
    
        ),
      );
  }
}
