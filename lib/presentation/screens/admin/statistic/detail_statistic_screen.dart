import 'package:flutter/material.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/admin/statistic/components/item_stat.dart';
import 'package:grocery/presentation/widgets/box.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';
import 'package:intl/intl.dart';

class DetailStatisticScreen extends StatefulWidget {
  const DetailStatisticScreen({super.key});

  @override
  State<DetailStatisticScreen> createState() => _DetailStatisticScreenState();
}

class _DetailStatisticScreenState extends State<DetailStatisticScreen> {
  // Khởi tạo mốc thời gian cần thống kê.
  late DateTime beginDate;
  late DateTime endDate;
  String dateDescription = 'This month';

  @override
  void initState() {
    // Lấy ngày đầu tiên của tháng và năm hiện tại.
    beginDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    // Lấy ngày cuối cùng của tháng và năm hiện tại.
    endDate = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: <Widget>[
                Text(
                  dateDescription,
                  style: AppStyles.semibold.copyWith(fontSize: 16),
                ),
                Text(
                  "${DateFormat('dd/MM/yyyy').format(beginDate)} - ${DateFormat('dd/MM/yyyy').format(endDate)}",
                  style: AppStyles.medium,
                ),
              ],
            ),
            const Icon(Icons.arrow_drop_down, color: AppColors.gray),
          ],
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
                            color: Color(0xFFFBC02D)),
                        SizedBox(height: 10),
                        ItemStat(
                            title: 'Cancelled',
                            number: 9,
                            color: Color(0xFFFF0000)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
