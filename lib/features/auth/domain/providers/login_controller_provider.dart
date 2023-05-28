import 'package:academus_2/features/auth/domain/states/auth_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginController extends StateNotifier<AuthState> {
  LoginController(this.ref) : super(const AuthStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const AuthStateLoading();

    try {
      await ref.read(authRepositoryProvider).login(email, password);
      state = const AuthStateSuccess();
    } catch (e) {
      state = AuthStateError(e.toString());
    }
  }
}

final loginControllerProvider =
StateNotifierProvider<LoginController, AuthState>((ref) {
  return LoginController(ref);
});