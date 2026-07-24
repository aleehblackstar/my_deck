import 'package:fase_4/shared/constants.dart';
import 'package:uno/uno.dart';

class AuthService {
  final Uno _uno = Uno();

  Future<void> register ({
    required String email,
    required String password,
  }) async {
    try {
      await _uno.post("${Constants.baseApiUrl}/api/register",
      data: {
      "email" : email,
      "password" : password,
      },
    );
  } on UnoError catch (erro) {
    throw Exception("Erro ao criar conta $erro");
  }
  }
}