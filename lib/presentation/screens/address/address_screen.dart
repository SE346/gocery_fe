import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/presentation/res/colors.dart';
import 'package:grocery/presentation/res/style.dart';
import 'package:grocery/presentation/screens/address/add_edit_address_screen.dart';
import 'package:grocery/presentation/screens/address/components/item_address.dart';
import 'package:grocery/presentation/services/address_bloc/address_bloc.dart';
import 'package:grocery/presentation/widgets/custom_app_bar.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  AddressBloc get _bloc => BlocProvider.of<AddressBloc>(context);

  @override
  void initState() {
    super.initState();
    _bloc.add(AddressStarted());
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
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AddEditAddressScreen(
                    currentAddress: null,
                  ),
                ),
              );
            },
            child: Text(
              'Add',
              style: AppStyles.medium.copyWith(
                color: AppColors.primary,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is AddressSuccess) {
            List<Address> addresses = state.addresses;

            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                Address address = addresses[index];

                return ItemAddress(
                  address: address,
                  callback: (id) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => AddEditAddressScreen(
                          currentAddress: address,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
