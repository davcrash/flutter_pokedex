import 'package:flutter/material.dart';

const maxMobileWidth = 600;

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobileBody,
    required this.desktopBody,
  }) : super(key: key);

  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < maxMobileWidth) {
          return mobileBody;
        }
        return desktopBody;
      },
    );
  }
}
