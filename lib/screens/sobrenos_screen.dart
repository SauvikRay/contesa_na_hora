import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/app_drawer.dart';

class SobrenosScreen extends StatefulWidget {
  const SobrenosScreen({Key? key}) : super(key: key);

  @override
  State<SobrenosScreen> createState() => _SobrenosScreenState();
}

class _SobrenosScreenState extends State<SobrenosScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MainAppBarWidget(
          text: 'Sobrenos',
        ),
        drawer: const AppDrawer(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelper.verticalSpaceSmall,
              Text(
                "Sobre nós",
                style: TextFontStyle.headsub1,
              ),
              UIHelper.verticalSpaceMedium,
              Text(
                "Somos uma equipa de advogados com valências em direito rodoviário. Temos uma vasta experiência na defesa de contraordenações (todo o tipo de infrações estradais e não estradais) assim como, experiência comprovada em todas as fases dos processos, atendendo a cada caso concreto.",
                style: TextFontStyle.termsCondition.copyWith(
                  letterSpacing: 0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.appDrawerTextColor,
                ),
              ),
              UIHelper.verticalSpaceMedium,
              UIHelper.customDivider(),
              UIHelper.verticalSpaceMedium,
              Text(
                "Serviços",
                style: TextFontStyle.headsub1,
              ),
              UIHelper.verticalSpaceMedium,
              Text(
                  '''Prestamos um serviço personalizado informando e esclarecendo os nossos clientes como se podem e devem defender, de modo a evitar possíveis coimas e sanções acessórias de inibição de condução ou apreensão de veículo no caso de pessoas coletivas (empresa).

Trabalhamos com foco na defesa das variadas infrações estradais e não estradais, tais como:''',
                  style: TextFontStyle.termsCondition.copyWith(
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.appDrawerTextColor,
                  )),
              UIHelper.verticalSpaceMedium,
              const SobrenotextWidget(text: "Infrações ao Código da Estrada;"),
              UIHelper.verticalSpaceSmall,
              const SobrenotextWidget(
                  text:
                      "Infrações sobre falta de pagamento de taxas de portagem em infraestruturas rodoviárias;"),
              UIHelper.verticalSpaceSmall,
              const SobrenotextWidget(
                  text:
                      "Circulação com excesso de peso por parte de transportadoras rodoviárias;"),
              UIHelper.verticalSpaceSmall,
              const SobrenotextWidget(
                  text:
                      "Desrespeito das regras relativas à instalação e uso do tacógrafo em veículos de transportes e também repouso diário, por exemplo."),
            ],
          ),
        ),
      ),
    );
  }
}

class SobrenotextWidget extends StatelessWidget {
  final String text;
  const SobrenotextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(top: 3.r),
        child: Container(
          height: 11.h,
          width: 11.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.r),
            color: AppColors.primaryColor,
          ),
        ),
      ),
      UIHelper.horizontalSpaceSmall,
      SizedBox(
        width: .8.sw,
        child: Text(text,
            style: TextFontStyle.termsCondition.copyWith(
              letterSpacing: 0,
              fontWeight: FontWeight.w500,
              color: AppColors.appDrawerTextColor,
            )),
      ),
    ]);
  }
}
