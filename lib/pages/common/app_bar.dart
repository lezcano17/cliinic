import 'package:cliinic/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      backgroundColor: Colors.cyan,
      titleSpacing: 15,
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              iconSize: 30,
              icon: Icon(Icons.logout_outlined),
              onPressed: () {
                Get.offNamed(Routes.getLoginRoute());
              },
            )),
      ],
    );
  }
}
