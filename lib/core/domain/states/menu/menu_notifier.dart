import 'package:academus_2/core/domain/states/menu/menu_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuStateNotifier extends StateNotifier<MenuState> {
  MenuStateNotifier(super.state);

  String getIndex() {
    return state.indexMenu;
  }

  void changeIndex(String newIndex) {
    state.indexMenu = newIndex;
  }
}
