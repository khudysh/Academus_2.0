import 'package:academus_2/features/auth/domain/entity/user_credentials.dart';
import 'package:academus_2/features/auth/domain/services/auth_service.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationRepository {
  @protected
  final AuthService authService;

  AuthenticationRepository(this.authService);

  Future<String> login(UserCredentials loginCred);

  Future<void> register(UserCredentials registerCred);
}