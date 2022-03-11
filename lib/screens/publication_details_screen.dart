import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:contesta_na_hora/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/contasa_helper.dart';

class PublicationDetailsScreen extends StatefulWidget {
  const PublicationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PublicationDetailsScreen> createState() =>
      _PublicationDetailsScreenState();
}

class _PublicationDetailsScreenState extends State<PublicationDetailsScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('16-02-2022', style: TextFontStyle.publicationDateText),
                UIHelper.verticalSpaceMedium,
                Text(
                    'Direito Estradal para Todos & Carta por Pontos 130 Respostas Essenciais',
                    style: TextFontStyle.publicationHeadText),
                UIHelper.verticalSpaceMedium,
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1498084393753-b411b2d26b34?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=400&q=80',
                    height: 344.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                UIHelper.verticalSpaceMedium,
                Text(
                  '''O tema do Direito Estradal é, hoje, um assunto sério, uma vez que os processos de contraordenação fazem parte da vida de todos os condutores: todos os dias são instaurados milhares de procedimentos contraordenacionais.

Todos os dias ocorrem acidentes de viação com consequências devastadoras. É essencial o cumprimento das regras de trânsito, mas também o conhecimento dos procedimentos a adotar em diversas situações da condução.

Um dos grandes objetivos desta obra é, precisamente, alertar os condutores para a panóplia de hipóteses legais que têm ao dispor, a fim de cumprirem as regras de trânsito e não serem consequentemente multados ''',
                  style: TextFontStyle.publicationDetailText,
                ),
                UIHelper.verticalSpaceSemiLarge,
                customeButton(
                    name: "Compre já",
                    onCallBack: () {},
                    height: 50.h,
                    minWidth: double.infinity,
                    borderRadius: 20.r,
                    color: AppColors.secondaryColor,
                    textStyle: TextFontStyle.submitButtonText,
                    context: context),
                SizedBox(
                  height: 80.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
