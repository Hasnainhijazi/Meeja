import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../constants.dart';
import '../../custom_widgets/custom_app_bar.dart';

class ConnectionsScreen extends StatelessWidget {
  const ConnectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leadingIcon: IconlyLight.arrow_left,
          title: Text('Connections',style: kAppBarTextStyle)
      ),
    );
  }
}
