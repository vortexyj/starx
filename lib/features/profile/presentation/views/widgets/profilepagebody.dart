import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:starx/core/utils/assets.dart';
import 'package:starx/features/feed/presentation/views/widgets/profile_failure_view.dart';
import 'package:starx/features/feed/presentation/views/widgets/profile_loading_view.dart';
import 'package:starx/features/profile/presentation/manager/profilecubit/profile_cubit.dart';
import 'package:starx/features/profile/presentation/views/widgets/gridactionsection.dart';
import 'package:starx/features/profile/presentation/views/widgets/gridlist.dart';
import 'package:starx/features/profile/presentation/views/widgets/pagetopbar.dart';
import 'package:starx/features/profile/presentation/views/widgets/profileinfosection.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              enabled: true,
              child: const ProfileLoadingView() );
        }else if (state is ProfileSuccess) {
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
                          padding:
                              EdgeInsets.only(left: 17.0, right: 17.0, top: 5),
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
        } else{
          return ProfileFailureView();
        }
      },
    );
  }
}