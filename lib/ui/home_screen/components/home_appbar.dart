import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/unit/unit_cubit.dart';
import 'package:weather_app/constants/colors/app_colors.dart';
import 'package:weather_app/repository/unit_repo.dart';
import 'package:weather_app/ui/settings_screen/settings_screen.dart';

import '../../swiper.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, 'manage_screen');
          },
          child: Image.asset('assets/icons/plus.png',
              height: 32, width: 32, color: AppColor.primaryColor),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Swiper(
                  color: AppColor.primaryColor,
                ),
                Swiper(),
                Swiper(),
              ],
            ),
          ],
        ),
        InkWell(
          onTap: () {
            final repository = RepositoryProvider.of<UnitRepo>(context);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return BlocProvider(
                    create: (context) => UnitCubit(repository),
                    child: SettingsScreen(),
                  );
                },
              ),
            );
          },
          child: Image.asset(
            'assets/icons/menu.png',
            height: 32,
            width: 32,
            color: AppColor.primaryColor,
          ),
        )
      ],
    );
  }
}
