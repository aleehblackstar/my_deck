import 'package:fase_4/features/authentication/services/auth_service.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = " ".obs;

  Future<bool> register({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    errorMessage.value = " ";

    try {
      await _authService.register(email: email, password: password);
      return true;
    } catch (error) {
      errorMessage.value = "Não foi possível criar a conta. Tente novamente.";
      return false;
    } finally {
      isLoading.value = false;
    }
  } 
}