import 'package:flutter/material.dart';
import 'package:grocery/data/models/transaction.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/transactions/components/item_transaction.dart';
import 'package:grocery/presentation/screens/admin/transactions/transaction_detail_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<Transaction> transactions = [
    Transaction(
      orderStatus: OrderStatus.finished,
      id: '#321DERS',
      totalPayment: '\$12.04',
      username: 'username',
      createdAt: '08/04/2023',
    ),
    Transaction(
      orderStatus: OrderStatus.inprogress,
      id: '#321DERS',
      totalPayment: '\$12.04',
      username: 'username',
      createdAt: '08/04/2023',
    ),
    Transaction(
      orderStatus: OrderStatus.cancelled,
      id: '#321DERS',
      createdAt: '08/04/2023',
      totalPayment: '\$12.04',
      username: 'username',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: true,
        title: Text(
          'Transactions',
          style: AppStyles.bold.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          Transaction transaction = transactions[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) =>
                        TransactionDetailScreen(transaction: transaction),
                  ),
                );
              },
              child: ItemTransaction(transaction: transaction));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
