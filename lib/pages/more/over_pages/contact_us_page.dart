import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/back_arrow_button.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({super.key});

  final TextEditingController _textMailSubjectController =
      TextEditingController();
  final TextEditingController _textMailBodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111216),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BackArrowButton(onTap: () => Navigator.of(context).pop()),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Связаться с нами',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff)
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    'Если у Вас остались вопросы или \nпожелания, Вы можете связаться с нами.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                        color: Color(0xffffffff)
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Text(
                    'Как к вам обращатся?',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color808080,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    // height: 112,
                    color: AppColors.color191A1F,
                    child: TextField(
                      cursorColor: AppColors.colorFF9900,
                      controller: _textMailSubjectController,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14,color: Color(0xffffffff)),
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  const Text(
                    'Опишите вашу ситуацию',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color808080,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    // height: 112,
                    color: AppColors.color191A1F,
                    child: TextField(
                      cursorColor: AppColors.colorFF9900,
                      controller: _textMailBodyController,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 5,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xffffffff)),
                      decoration: const InputDecoration(
                        isCollapsed: true,
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    color: AppColors.color26282F,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          final Uri mail = Uri(
                            scheme: 'mailto',
                            path: '<email>',
                            query:
                                'subject=${_textMailSubjectController.text}&body=${_textMailBodyController.text}',
                          );
                          launchUrl(mail);
                        },
                        child: Container(
                          height: 50,
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Отправить',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                      color: Color(0xffffffff)
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
