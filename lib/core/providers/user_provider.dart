// lib/core/providers/user_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserState {
  final bool isLoggedIn;
  final String? username;
  final String? email;

  UserState({this.isLoggedIn = false, this.username, this.email});

  UserState copyWith({bool? isLoggedIn, String? username, String? email}) {
    return UserState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }
}

// Provider simple para el estado del usuario
final userProvider = StateProvider<UserState>((ref) {
  return UserState();
});
