import 'package:flutter/material.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/features/profile/presentation/views/widgets/gridactionsection.dart';
import 'package:starx/features/profile/presentation/views/widgets/gridlist.dart';
import 'package:starx/features/profile/presentation/views/widgets/pagetopbar.dart';
import 'package:starx/features/profile/presentation/views/widgets/profileinfosection.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Image.asset(AssetsData.background2),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 17.0, right: 17.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        PageTopBar(),
                        SizedBox(height: 35, width: double.infinity),
                        ProfileInfoSection(),
                        SizedBox(height: 20),
                        GridActionSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const GridList(),
        ],
      ),
    );
  }
}
