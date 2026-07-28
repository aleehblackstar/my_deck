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

  Future<String> login ({
      required String email, 
      required String password,
    }) async {
      try {
        final response = await _uno.post("${Constants.baseApiUrl}/api/login",
        data: {
          "email" : email,
          "password" : password,
        },
      );

      return response.data as String; 
    } on UnoError catch (error) {
      throw Exception("Erro ao fazer login: $error");
      }
    }
  
}