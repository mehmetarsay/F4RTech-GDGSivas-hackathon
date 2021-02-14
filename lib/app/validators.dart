String passwordValidator(String password) {
  if (password.length < 6) {
    return 'Şifrenizin 6 karakterden daha büyük olması gerekmektedir.';
  }
  if (!password.contains(RegExp('[0-9]')) ||
      !password.contains(RegExp('[a-z]')) ||
      !password.contains(RegExp('[A-Z]'))) {
    return 'Şifreniz en az bir sayı,bir büyük harf ve bir küçük harf içermelidir';
  }
  return null;
}

String emailValidator(String email) {
  if (RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return null;
  } else {
    return 'Hata';
  }
}

String rePasswordValidator(String password,String rePassword)
{
  if(password!=rePassword)
    {
      return 'İki Şifre birbiriyle uyuşmuyor';
    }
  else {
    return null;
  }
}

String phoneValidator(phone) {
  var regExp = RegExp('(05|5)[0-9][0-9][0-9]([0-9]){6,6}');
  if (phone.length == 0) {
    return 'Lütfen Telefon Numarası Giriniz';
  } else if (!regExp.hasMatch(phone)) {
    return 'Geçersiz Telefon Numarası';
  }
  return null;
}