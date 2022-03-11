import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/all_routes.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/screens/publication_details_screen.dart';
import 'package:contesta_na_hora/screens/publicocaes_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/contasa_helper.dart';
import '../widgets/homecard_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    appBarName(name: "Home", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    onTap: () {
                      Navigator.pushNamed(context, Routes.navigation,
                          arguments: const PublicationScreen());
                    },
                    child: Text(
                      'Ver tudo',
                      style: TextFontStyle.verTudoText,
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpaceMedium,
              ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(context, Routes.navigation,
                              arguments: const PublicationScreen());
                        },
                        child: SizedBox(
                          height: 85.h,
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
                                    height: 0.065.sh,
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
                      ),
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Divider(
                          color: AppColors.deviderColor,
                        ),
                      ),
                  itemCount: 5)
            ],
          ),
        ),
      ),
    );
  }
}
