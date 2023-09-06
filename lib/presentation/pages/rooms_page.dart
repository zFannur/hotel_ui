import 'package:flutter/material.dart';
import 'package:job_test/presentation/bloc/rooms_bloc/rooms_bloc.dart';
import 'package:job_test/presentation/widgets/select_button_widget.dart';
import 'package:job_test/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_test/core/unknown_error.dart';
import 'package:job_test/entity/rooms.dart';
import 'package:intl/intl.dart';
import 'package:job_test/presentation/widgets/carousel_widget.dart';
import 'package:job_test/presentation/widgets/peculiarities_widget.dart';
import 'package:job_test/core/config/app_config.dart';
import 'package:job_test/presentation/widgets/navigation_panel_widget.dart';
import 'booking_page.dart';

class RoomsPage extends StatelessWidget {
  final String name;
  const RoomsPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RoomsBloc, RoomsState>(
        builder: (context, state) {
          if (state is Empty) {
            return const SizedBox(
              height: 1,
            );
          } else if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is Loaded) {
            return _Room(rooms: state.rooms, name: name);
          } else if (state is Error) {
            return ServerError(message: state.message, reload: () {
              context.read<RoomsBloc>().add(GetRoomsEvent());
            },);
          } else {
            return const UnknownError();
          }
        },
      ),
    );
  }
}

class _Room extends StatelessWidget {
  final String name;
  final Rooms rooms;

  const _Room({required this.rooms, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xfff6f6f9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            NavigationPanelWidget(text: name),
            Expanded(
              child: RoomBuilder(rooms: rooms.rooms),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomBuilder extends StatelessWidget {
  final List<Room> rooms;

  const RoomBuilder({super.key, required this.rooms});

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / AppConfig.baseWidth;
    double ffem = fem * AppConfig.femValue;
    final formatter = NumberFormat('#,###');

    return ListView.builder(
      itemBuilder: (context, item) {
        return Column(
          children: [
            SizedBox(
              height: 8 * fem,
            ),
            Container(
              padding:
                  EdgeInsets.fromLTRB(16 * fem, 16 * fem, 16 * fem, 16 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(12 * fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),
                    width: double.infinity,
                    height: 257 * fem,
                    child: CarouselWidget(imagesUrl: rooms[item].imageUrls),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 7 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 339 * fem,
                    ),
                    child: Text(
                      rooms[item].name,
                      style: SafeGoogleFont(
                        'SF Pro Display',
                        fontSize: 22 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.2000000694 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                  PeculiaritiesList(peculiarities: rooms[item].peculiarities),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 8 * fem, 151 * fem, 16 * fem),
                      padding: EdgeInsets.fromLTRB(
                          1 * fem, 5 * fem, 10 * fem, 4 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0x190d72ff),
                        borderRadius: BorderRadius.circular(5 * fem),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 3 * fem, 0 * fem),
                            child: Text(
                              'Подробнее о номере',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'SF Pro Display',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2000000477 * ffem / fem,
                                color: const Color(0xff0d72ff),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 1 * fem),
                            width: 6 * fem,
                            height: 12 * fem,
                            child: Image.asset(
                              'assets/page-1/images/icons-icons-icons-ebH.png',
                              width: 6 * fem,
                              height: 12 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 5 * fem, 16 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 23 * fem, 0 * fem),
                          child: Text(
                            '${formatter.format(rooms[item].price).replaceAll(',', ' ')} ₽',
                            style: SafeGoogleFont(
                              'SF Pro Display',
                              fontSize: 30 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2 * ffem / fem,
                              color: const Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 2 * fem),
                          child: Text(
                            rooms[item].pricePer,
                            style: SafeGoogleFont(
                              'SF Pro Display',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2000000477 * ffem / fem,
                              color: const Color(0xff828796),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SelectButtonWidget(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BookingPage()));
                    },
                    text: 'Выбрать номер',
                  ),
                ],
              ),
            ),
          ],
        );
      },
      itemCount: rooms.length,
    );
  }
}
