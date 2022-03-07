import 'package:app_flutter/common/menuscreen.dart';
import 'package:flutter/material.dart';

class OrgsDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: MenuScreen());
  }
}
