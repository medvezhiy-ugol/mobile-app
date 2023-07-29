import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../close_circle_button.dart';

class AboutAppTile extends StatelessWidget {
  const AboutAppTile({
    super.key,
    required this.widget,
    required this.title,
    required this.description,
  });

  final Widget widget;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
  builder: (context, state) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (context) => Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(state.context!).padding.top
            ),
            child: Container(
              color: Color(0xff111216),
              child: Column(
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CloseCircleButton(onTap: () => Navigator.of(context).pop()),
                      const SizedBox(width: 8,)
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Пользовательское соглашение',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffffffff,)
                        ),)
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 18,
            bottom: 18,
          ),
          child: Row(
            children: [
              SizedBox(
                width:
                MediaQuery.of(context).size.width * 0.7,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                ),
              ),
            ],
          )),
    );
  },
);
  }
}
