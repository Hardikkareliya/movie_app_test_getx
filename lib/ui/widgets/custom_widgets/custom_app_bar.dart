import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  const CustomAppBar({
    Key? key,
    this.height = 70,
  }) : super(key: key, preferredSize: const Size(414, 70), child: const SizedBox());

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      title: SizedBox(
        height: height,
        child: const Center(
          child: Text(
            'Movie List',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      centerTitle: true,
    );
  }
}
