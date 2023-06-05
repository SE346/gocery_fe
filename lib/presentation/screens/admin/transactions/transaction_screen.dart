import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/order.dart';
import 'package:grocery/presentation/helper/loading/loading_screen.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/transactions/components/item_transaction.dart';
import 'package:grocery/presentation/services/transaction_bloc/transaction_bloc.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  TransactionBloc get _bloc => BlocProvider.of<TransactionBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(TransactionStarted());
  }

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
      body: BlocBuilder<TransactionBloc, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return LoadingScreen().showLoadingWidget();
          } else if (state is TransactionSuccess) {
            List<Order> orders = state.orders;

            return ListView.builder(
              itemBuilder: (context, index) {
                Order order = orders[index];
                return GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => (
                      //       transaction: order,
                      //     ),
                      //   ),
                      // );
                    },
                    child: ItemTransaction(order: order));
              },
              itemCount: orders.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
