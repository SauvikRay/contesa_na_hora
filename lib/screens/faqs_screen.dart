import 'package:contesta_na_hora/constants/app_color.dart';
import 'package:contesta_na_hora/constants/text_font_style.dart';
import 'package:contesta_na_hora/helpers/ui_helpers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/contasa_helper.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  bool expandedTile = false;

  @override
  void initState() {
    super.initState();
    appBarName(name: "FAQs", context: context);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: <Widget>[
              Text(
                'Perguntas e respostas que podem ajudá-lo.',
                style: TextFontStyle.contestarBodyText,
              ),
              UIHelper.verticalSpaceSmall,
              Card(
                color: expandedTile
                    ? AppColors.secondaryColor
                    : AppColors.expandedList,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (expandedTile) {
                        _controller.forward();
                      } else {
                        _controller.reverse();
                      }
                      expandedTile = !expandedTile;
                    });
                  },
                  child: ListTile(
                    title: Text(
                      'O que é uma contraordenação rodoviária?',
                      style: expandedTile
                          ? TextFontStyle.expandedTitleTrue
                          : TextFontStyle.expandedTitleFalse,
                    ),
                    trailing: (expandedTile)
                        ? const Icon(
                            Icons.expand_more_rounded,
                            color: AppColors.expandedTilebgColor,
                          )
                        : const Icon(
                            Icons.expand_less_rounded,
                            color: AppColors.appDrawerTextColor,
                            size: 25,
                          ),
                  ),
                ),
              ),
              AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                height: expandedTile ? 500 : 0,
                child: const Text(
                    'Segundo   o   artigo   131.º   do   CE   (Código   da   Estrada),   constitui contraordenação rodoviária todo o facto ilícito e censurável que preencha um tipo legal correspondente à violação de norma do CE ou em legislação complementar  e  especial,  cuja  aplicação  esteja  cometida  à  ANSR (Autoridade Nacional de Segurança Rodoviária), e para a qual, se comine uma coima.'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
