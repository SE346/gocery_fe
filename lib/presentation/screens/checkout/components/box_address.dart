import 'package:flutter/material.dart';
import 'package:grocery/data/models/address.dart';
import 'package:grocery/presentation/res/images.dart';
import 'package:grocery/presentation/widgets/box.dart';

class BoxAddress extends StatelessWidget {
  final Address address;
  const BoxAddress({
    super.key,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Box(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Image.asset(AppAssets.fakeMap),
        ],
      ),
    );
  }
}
