import 'package:flutter/material.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/address/components/item_address.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  List<Address> addresses = [
    Address(
      isPrimary: true,
      address: '374 Xô Viết Nghệ Tĩnh, Bình Thạnh, Hồ Chí Minh',
      displayName: 'My Home',
    ),
    Address(
      isPrimary: false,
      address: '09 Đống Đa, Tân Bình, Hồ Chí Minh',
      displayName: 'My Company',
    ),
  ];

  String primaryAddress = '';

  @override
  void initState() {
    super.initState();
    for (var address in addresses) {
      if (address.isPrimary) {
        primaryAddress = address.displayName;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Address',
          style: AppStyles.bold.copyWith(
            fontSize: 18,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Add',
              style: AppStyles.medium.copyWith(
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          Address address = addresses[index];
          return ItemAddress(
            address: address,
            callback: (displayName) {
              setState(() {
                primaryAddress = displayName;
              });
            },
            isPrimary: primaryAddress == address.displayName,
          );
        },
      ),
    );
  }
}
