import 'package:contesta_na_hora/networks/api_acess.dart';

import '../constants/app_color.dart';
import '../constants/text_font_style.dart';
import '../helpers/all_routes.dart';
import '../helpers/ui_helpers.dart';
import '../screens/publicocaes_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/appbarname_helper.dart';
import '../widgets/homecard_widget.dart';
import '../widgets/loading_indicators.dart';
import '../widgets/pablication_list_widget.dart';
import 'publication_details_screen.dart';

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
              StreamBuilder(
                stream: getPublicationRXobj.getPublicationData,
                builder: (context, AsyncSnapshot publicationData) {
                  if (publicationData.hasData) {
                    List publication = publicationData.data['publication_list'];
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          UIHelper.verticalSpaceSmall,
                      shrinkWrap: true,
                      itemCount: 2,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return HomecardWidget(
                          imageUrl: publication[index]['thumbnail_url'],
                          bigTitle: publication[index]['title'],
                          smallText: publication[index]['description'],
                          buttonText: publication[index]['button_name'],
                          cardColor: publication[index]['background_color'],
                        );
                      },
                    );
                  } else if (publicationData.hasError) {
                    return const SizedBox.shrink();
                  }
                  return SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: loadingIndicatorCircle(context: context),
                    ),
                  );
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
              StreamBuilder(
                  stream: getBlogRXobj.getBlogData,
                  builder: (context, AsyncSnapshot blogData) {
                    if (blogData.hasData) {
                      List data = blogData.data['blog_list'];
                      return ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Navigator.popAndPushNamed(
                                      context, Routes.navigation,
                                      arguments: PublicationDetailsScreen(
                                        data: data[index],
                                      ));
                                },
                                child: PublicationList(
                                  title: data[index]['title'],
                                  imageUrl: data[index]['thumbnail_url'],
                                  dateTime: data[index]['date'],
                                ),
                              ),
                          separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: Divider(
                                  color: AppColors.deviderColor,
                                ),
                              ),
                          itemCount: data.length);
                    } else if (blogData.hasError) {
                      return const SizedBox.shrink();
                    }
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 100,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: loadingIndicatorCircle(context: context),
                      ),
                    );
                  }),
              UIHelper.verticalSpaceMedium,
              UIHelper.verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}
