import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/all_routes.dart';
import 'package:contesta_na_hora/helpers/navigation_service.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/widgets/app_bar_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/homecard_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const MainAppBarWidget(
          text: 'Home',
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                leading: const Text('home'),
                onTap: () {
                  NavigationService.popAndReplace(Routes.home);
                },
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: ListView(
            children: [
              ListView.separated(
                separatorBuilder: (context, index) =>
                    UIHelper.verticalSpaceSmall,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const HomecardWidget();
                },
              ),
              const Divider(
                color: AppColors.deviderColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Publicações',
                    style: TextFontStyle.publicationText,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      'Ver tudo',
                      style: TextFontStyle.verTudoText,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpaceMedium,
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => SizedBox(
                        height: 80.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1498084393753-b411b2d26b34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
                                height: 65.h,
                                width: 65.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            UIHelper.horizontalSpaceSmall,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: .7.sw,
                                  height: .065.sh,
                                  child: Text(
                                    'Direito Estradal para Todos & Carta por Pontos 130 Respostas Essenciais',
                                    style: TextFontStyle.publicationListText,
                                    // overflow: TextOverflow.fade,
                                  ),
                                ),
                                UIHelper.verticalSpaceSmall,
                                Text(
                                  'mai 19, 2021',
                                  style: TextFontStyle.publicationDateText,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Divider(
                          color: AppColors.deviderColor,
                        ),
                      ),
                  itemCount: 2)
            ],
          ),
        ),
      ),
    );
  }
}
