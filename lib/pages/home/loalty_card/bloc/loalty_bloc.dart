import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/models/loalty_card.dart';
import 'package:medvezhiy_ugol/services/loalty_service.dart';
import 'package:meta/meta.dart';

import '../../../../services/auth_service.dart';

part 'loalty_event.dart';
part 'loalty_state.dart';

class LoaltyBloc extends Bloc<LoaltyEvent, LoaltyState> {
  final LoaltyCardService loaltyCardService;

  String name = '';
  String cardId = '';
  double cardBalance = 0;
  LoaltyCard? _card;

  LoaltyBloc({
    required this.loaltyCardService,
  }) : super(LoaltyLoadingState()) {
    on<LoaltyEvent>(
      (event, emit) async {
        if (event is LoaltyLoadingEvent) {
          _initLoaltyCard();
          emit(LoaltyLoadingState());
        } else if (event is LoaltyLoadedEvent) {
          await Future.delayed(const Duration(seconds: 5), () {});
          emit(LoaltyLoadedState(
            cardBalance: cardBalance,
            cardId: cardId,
            name: name,
          ));
        }
      },
    );
    add(LoaltyLoadingEvent());
  }

  Future<void> _initLoaltyCard() async {
    try {
      _card = await Isolate.run(loaltyCardService.getUserCard);
      if (_card != null) {
        name = _card!.name;
        cardId = _card!.id;
        cardBalance = _card!.walletBalances[0].balance;
        add(LoaltyLoadedEvent());
      }
    } catch (e) {}
  }
}
