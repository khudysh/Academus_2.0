import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();

  @override
  List<Object> get props => [];
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();

  @override
  List<Object> get props => [];
}

class AuthStateSuccess extends AuthState {
  const AuthStateSuccess();

  @override
  List<Object> get props => [];
}

class AuthStateError extends AuthState {
  final String error;

  const AuthStateError(this.error);

  @override
  List<Object> get props => [error];
}