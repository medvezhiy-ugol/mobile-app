import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';
import '../../../../ui/primary_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';

class FullViewRestaurantWidget extends StatefulWidget {
  const FullViewRestaurantWidget({super.key, required this.latStart, required this.latEnd, required this.lonStart, required this.lonEnd, required this.isCenter});

  final double latStart;
  final double lonStart;
  final double latEnd;
  final double lonEnd;
  final bool isCenter;

  @override
  State<FullViewRestaurantWidget> createState() =>
      _FullViewRestaurantWidgetState();
}

class _FullViewRestaurantWidgetState extends State<FullViewRestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              accentColor: AppColors.color191A1F,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 27,
              ),
              Text(
                'Медвежий угол Свободы Ярославль',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.isCenter ? '150023, Ярославль, улица Свободы, 45' : '150064, Ярославль, Ленинградский проспект, 62',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InfoBox(
                title: 'Режим работы',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Зал',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                        widget.isCenter
                        ? DateTime.now().hour > 22 || DateTime.now().hour < 10
                            ? 'Откроется в 10:00'
                        : 'Открыто до 22:00'
                        :  DateTime.now().hour > 23 || DateTime.now().hour < 11
                        ? 'Откроется в 11:00'
                        : 'Открыто до 23:00',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: widget.isCenter
                              ? DateTime.now().hour > 22 || DateTime.now().hour < 10
                              ? const Color(0xffFF3838)
                              : const Color(0xff32CD43)
                              :  DateTime.now().hour > 23 || DateTime.now().hour < 11
                              ? const Color(0xffFF3838)
                              : const Color(0xff32CD43)
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              InfoBox(
                title: 'Особенности',
                child: RestaurantAttributes(height: 21),
              ),
              SizedBox(
                height: 3,
              ),
              InfoBox(
                title: 'Телефон',
                child: Row(
                  children: [
                    Text(
                      '+79231235673',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
                builder: (context, state) {
                  return PrimaryButton.icon(
                    icon: Icons.map,
                    label: Text(
                      'Построить маршрут',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      final coords = Coords(37.759392, -122.5107336);
                      final title = "Ocean Beach";
                      final availableMaps = await MapLauncher.installedMaps;

                      showModalBottomSheet(
                        context: state.context!,
                        backgroundColor: Color(0xff191A1F),
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 16),
                                    Center(
                                      child: Container(
                                        height: 4,
                                        width: 48,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(9),
                                          color: Color(0xffD9D9D9).withOpacity(0.3)
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 36),
                                    Text(
                                      'Выберите сервис',
                                      style: TextStyle(
                                        fontFamily: 'Unbounded',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Color(0xffEFEFEF)
                                      ),
                                    ),
                                    SizedBox(height: 30),
                                    for (var map in availableMaps)
                                      Container(
                                        height: 65,
                                        margin: EdgeInsets.symmetric(
                                          vertical: 1
                                        ),
                                        color: Color(0xff26282F),
                                        child: ListTile(
                                          onTap: () =>
                                              map.showDirections(
                              destination: Coords(
                              widget.latStart,
                              widget.lonStart,
                            ),
                            destinationTitle: "Медвежий угол",
                            origin: Coords(widget.latEnd, widget.lonEnd),
                            originTitle: "Вы",
                            waypoints: [],
                            directionsMode: DirectionsMode.driving,
                          ),
                                          title: Text(map.mapName),
                                          leading: ClipRRect(
                                            borderRadius: BorderRadius.circular(90),
                                            child: SvgPicture.asset(
                                              map.icon,
                                              height: 30.0,
                                              width: 30.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Container(
                                      height: 65,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 1
                                      ),
                                      color: Color(0xff26282F),
                                      child: ListTile(
                                        onTap: () {
                                          Clipboard.setData(ClipboardData(text: widget.isCenter ? '150023, Ярославль, улица Свободы, 45' : '150064, Ярославль, Ленинградский проспект, 62'));
                                          Flushbar(
                                            message:  "Адрес скопирован",
                                            duration:  Duration(seconds: 3),
                                            flushbarPosition: FlushbarPosition.TOP,
                                          ).show(context);
                                        },
                                        title: Text("Скопировать адрес"),
                                        leading: ClipRRect(
                                          borderRadius: BorderRadius.circular(90),
                                          child: SvgPicture.asset(
                                            'assets/images/copt.svg',
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(
                height: 24,
              ),
              PrimaryButton(
                color: AppColors.colorFFB627,
                child: Text(
                  'Посмотреть меню',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  context.read<CustomNavbarCubit>().changeIndex(2);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget RestaurantAttributes({
    double height = 30,
  }) {
    return Container(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.color26282F,
            child: Center(
              child: Text(
                'Есть завтрак',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.color26282F,
            child: Center(
              child: Text(
                'Драйв',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget PrimaryButton({
  Widget InfoBox({required String title, required Widget child}) {
    return Container(
      height: 65,
      color: AppColors.color191A1F,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.color808080,
            ),
          ),
          Spacer(),
          child
        ],
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text('Fade Transition Example')),
//     body: Center(
//       child:

// ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: () {
//         setState(() {
//           currentIndex = (currentIndex + 1) % pages.length; // Increment the current index and wrap it around the list.
//         });
//       },
//       child: Icon(Icons.navigate_next),
//     ),
//   );
// }
}
