import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/services/user/category_detail_bloc/category_detail_bloc.dart';
import 'package:grocery/presentation/utils/money_extension.dart';

import '../../../widgets/custom_button.dart';

class BoxFilter extends StatefulWidget {
  const BoxFilter({super.key});

  @override
  State<BoxFilter> createState() => _BoxFilterState();
}

class _BoxFilterState extends State<BoxFilter> {
  RangeValues priceRange = const RangeValues(0, 110000000);
  CategoryDetailBloc get _bloc => BlocProvider.of<CategoryDetailBloc>(context);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Filter', style: AppStyles.bold.copyWith(fontSize: 21)),
          const SizedBox(height: 10),
          Text(
            'Price Range',
            style: AppStyles.medium,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              boxMoney(priceRange.start.round()),
              const SizedBox(width: 10),
              boxMoney(priceRange.end.round()),
            ],
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: RangeSlider(
              min: 0,
              max: 110000000,
              values: priceRange,
              activeColor: AppColors.primary,
              onChanged: (RangeValues values) {
                if (mounted) {
                  setState(() {
                    priceRange = values;
                  });
                }
              },
            ),
          ),
          CustomButton(
            content: 'Submit',
            margin: 0,
            onTap: () {
              int min = priceRange.start.round();
              int max = priceRange.end.round();
              _bloc.add(CategoryDetailProductsFiltered(min: min, max: max));
              Navigator.pop(context, [
                min,
                max,
              ]);
            },
          ),
        ],
      ),
    );
  }

  Widget boxMoney(int money) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.gray,
          ),
        ),
        child: Text(
          money.toDouble().toMoney,
          textAlign: TextAlign.center,
          style: AppStyles.regular,
        ),
      ),
    );
  }
}
