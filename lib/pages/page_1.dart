import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
    );
  }
}