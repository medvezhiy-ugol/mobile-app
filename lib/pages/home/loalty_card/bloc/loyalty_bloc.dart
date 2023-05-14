import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/models/loalty_card.dart';
import 'package:medvezhiy_ugol/services/loalty_service.dart';
import 'package:meta/meta.dart';

import '../../../../services/auth_service.dart';

part 'loalty_event.dart';
part 'loyalty_state.dart';

class LoyaltyBloc extends Bloc<LoyaltyEvent, LoyaltyState> {
  final LoyaltyCardService loyaltyCardService;

  String name = '';
  String cardId = '';
  double cardBalance = 0;
  LoaltyCard? _card;

  LoyaltyBloc({
    required this.loyaltyCardService,
  }) : super(LoyaltyLoadingState()) {
    on<LoyaltyEvent>(
      (event, emit) async {
        if (event is LoyaltyLoadingEvent) {
          _initLoaltyCard();
          emit(LoyaltyLoadingState());
        } else if (event is LoyaltyLoadedEvent) {
          emit(LoyaltyLoadedState(
            cardBalance: cardBalance,
            cardId: cardId,
            name: name,
          ));
        }
      },
    );
    add(LoyaltyLoadingEvent());
  }

  Future<void> _initLoaltyCard() async {
    try {
      _card = await Isolate.run(loyaltyCardService.getUserCard);
      if (_card != null) {
        name = _card!.name;
        cardId = _card!.id;
        cardBalance = _card!.walletBalances[0].balance;
        add(LoyaltyLoadedEvent());
      }
    } catch (e) {
    }
  }
}
