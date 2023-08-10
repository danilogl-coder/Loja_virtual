String getErrorString(String code) {
  switch (code) {
    case 'invalid-email':
      return 'Seu e-mail é inválido.';
    case 'wrong-password':
      return 'Sua senha está incorreta.';
    case 'user-not-found':
      return 'Usuario não encontrado.';


    default:
      return 'Um erro indefinido ocorreu.';
  }
}
