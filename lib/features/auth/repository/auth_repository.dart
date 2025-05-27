class AuthRepository {
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate API call
    return email == 'test@test.com' && password == 'password';
  }
}
