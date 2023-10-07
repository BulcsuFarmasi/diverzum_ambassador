import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<EmailRepository> emailRepositoryProvider = Provider<EmailRepository>((Ref ref) => EmailRepository());

class EmailRepository {
  Future<bool> checkEmail() {
    return Future.value(true);
  }
}