import 'package:contesta_na_hora/helpers/all_routes.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/screens/publication_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/text_font_style.dart';
import '../helpers/appbarname_helper.dart';

class PublicationScreen extends StatefulWidget {
  const PublicationScreen({Key? key}) : super(key: key);

  @override
  State<PublicationScreen> createState() => _PublicationScreenState();
}

class _PublicationScreenState extends State<PublicationScreen> {
  @override
  void initState() {
    super.initState();
    appBarName(name: "Publicações", context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 18.w),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.62),
            itemCount: 10,
            itemBuilder: (ctx, i) => InkWell(
              onTap: () => Navigator.pushNamed(
                context,
                Routes.navigation,
                arguments: const PublicationDetailsScreen(),
              ),
              child: SizedBox(
                  height: 100.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1498084393753-b411b2d26b34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
                          height: 160.h,
                          width: 160.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      UIHelper.verticalSpaceSmall,
                      SizedBox(
                        width: .65.sw,
                        height: 0.09.sh,
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
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
