import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/loalty_card.dart';
import '../../../../services/auth_service.dart';
import '../../../../services/loalty_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoyaltyCardService loyaltyCardService;
  final authService = Injector().get<AuthService>();

  String name = '';
  String cardId = '';
  double cardBalance = 0;
  LoaltyCard? _card;

  HomeBloc({
    required this.loyaltyCardService,
  }) : super(HomeLoadingLoyaltyCardState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeAuthEvent) {
        emit(HomeAuthState(
          cardBalance: cardBalance,
          cardId: cardId,
          name: name,
        ));
      } else if (event is HomeLoadingLoyaltyCardEvent) {
        _initLoaltyCard();
        emit(HomeLoadingLoyaltyCardState());
      } else if (event is HomeUnAuthEvent) {
        emit(HomeUnAuthState());
      }
    });
    if (authService.token != '' && loyaltyCardService.cardId == '') {
      add(HomeLoadingLoyaltyCardEvent());
    } else if (loyaltyCardService.cardId != '') {
      add(HomeAuthEvent());
    } else {
      add(HomeUnAuthEvent());
    }
  }

  Future<void> _initLoaltyCard() async {
    try {
      _card = await Isolate.run(loyaltyCardService.getUserCard);
      if (_card != null) {
        name = _card!.name;
        cardId = _card!.id;
        cardBalance = _card!.walletBalances[0].balance;
        add(HomeAuthEvent());
      }
    } catch (e) {
      // debugPrint('Error - get loyalty card');
    }
  }
}
