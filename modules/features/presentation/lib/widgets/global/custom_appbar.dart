import 'package:flutter/material.dart';
import 'package:presentation/theme/constants/source_sans_pro_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    required this.title,
    this.centerTitle = true,
    this.implyLeading = false,
  });
  final String? title;
  final bool? centerTitle;
  final bool? implyLeading;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: widget.centerTitle,
        elevation: 1,
        automaticallyImplyLeading: widget.implyLeading!,
        title: Text(
          widget.title!,
          style: kSourceSanProTitle18,
        ));
  }
}
