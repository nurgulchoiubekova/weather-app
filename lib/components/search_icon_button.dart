import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({
    this.onPressed,
    super.key,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset('assets/icons/search.svg', height: 34),
      ),
    );
  }
}