import 'package:flutter/material.dart';
import 'package:kurly_hackerton/util/design/color_palette.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: kurlyPurple,
      ),
    );
  }
}
