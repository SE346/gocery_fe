import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/statistic/components/item_stat.dart';
import 'package:grocery/presentation/screens/admin/statistic/detail_statistic_screen.dart';
import 'package:grocery/presentation/widgets/box.dart';
import 'package:grocery/presentation/widgets/custom_button.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.3,
        centerTitle: true,
        title: Text(
          'Statistics',
          style: AppStyles.bold.copyWith(
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20,
          top: 20,
        ),
        child: ListView(
          children: [
            Text(
              'Overview',
              style: AppStyles.bold.copyWith(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Box(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Text(
                    'Revenue',
                    style: AppStyles.medium,
                  ),
                  const Divider(color: AppColors.text),
                  Text(
                    '\$ 123,789.59',
                    style: AppStyles.bold.copyWith(
                      color: AppColors.secondary,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Box(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'Transactions',
                          style: AppStyles.medium,
                        ),
                        const Divider(color: AppColors.text),
                        const SizedBox(height: 15),
                        Text(
                          '1509',
                          style: AppStyles.semibold,
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Box(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    margin: EdgeInsets.only(top: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        ItemStat(
                            title: 'Finished',
                            number: 1000,
                            color: AppColors.primary),
                        SizedBox(height: 10),
                        ItemStat(
                          title: 'In progress',
                          number: 500,
                          color: Color(0xFFFBC02D),
                        ),
                        SizedBox(height: 10),
                        ItemStat(
                          title: 'Cancelled',
                          number: 9,
                          color: Color(0xFFFF0000),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Box(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'Users',
                          style: AppStyles.medium,
                        ),
                        const Divider(color: AppColors.text),
                        const SizedBox(height: 10),
                        Text(
                          '454',
                          style: AppStyles.semibold,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Image.asset(AppAssets.icChart),
                const SizedBox(width: 30),
                Expanded(
                  child: Box(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: [
                        Text(
                          'Products',
                          style: AppStyles.medium,
                        ),
                        const Divider(color: AppColors.text),
                        const SizedBox(height: 10),
                        Text(
                          '30',
                          style: AppStyles.semibold,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(color: AppColors.text),
            const SizedBox(height: 15),
            Text(
              'Explore detail',
              style: AppStyles.bold.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              'View statistics by date, month or year.',
              style: AppStyles.medium,
            ),
            const SizedBox(height: 30),
            CustomButton(
              content: 'View Detail',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const DetailStatisticScreen(),
                  ),
                );
              },
              color: AppColors.primary,
              margin: 0,
            )
          ],
        ),
      ),
    );
  }
}
