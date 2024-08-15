import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:starx/core/utils/colors.dart';
import 'package:starx/core/utils/navigationbarlist.dart';
import 'package:starx/features/navigationbar/presentation/views/widgets/widgetview.dart';

class NavigationBarBody extends StatefulWidget {
  const NavigationBarBody({super.key});

  @override
  State<NavigationBarBody> createState() => _NavigationBarBodyState();
}

class _NavigationBarBodyState extends State<NavigationBarBody> {
  int visit = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarCreative(
        top: 15,
        bottom: 15,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
        enableShadow: false,
        items: items,
        backgroundColor: Colors.white.withOpacity(0.21),
        color: Colors.black,
        colorSelected: ColorStyle.accentStroke,
        indexSelected: visit,
        isFloating: true,
        highlightStyle: const HighlightStyle(
            sizeLarge: true,
            isHexagon: true,
            elevation: 2,
            background: ColorStyle.black),
        onTap: (int index) => setState(() {
          visit = index;
        }),
      ),
      body: widgetViewer(visit),
    );
  }
}
