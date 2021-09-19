// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diver_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DriverStore on _DriverStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_DriverStore.canLogin'))
      .value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_DriverStore.canRegister'))
          .value;
  Computed<bool>? _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??= Computed<bool>(
          () => super.canForgetPassword,
          name: '_DriverStore.canForgetPassword'))
      .value;

  final _$userEmailAtom = Atom(name: '_DriverStore.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_DriverStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_DriverStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  final _$successAtom = Atom(name: '_DriverStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$loadingAtom = Atom(name: '_DriverStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$registerAsyncAction = AsyncAction('_DriverStore.register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$loginAsyncAction = AsyncAction('_DriverStore.login');

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$forgotPasswordAsyncAction =
      AsyncAction('_DriverStore.forgotPassword');

  @override
  Future<dynamic> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  final _$logoutAsyncAction = AsyncAction('_DriverStore.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_DriverStoreActionController = ActionController(name: '_DriverStore');

  @override
  void setUserId(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_DriverStoreActionController.startAction(
        name: '_DriverStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_DriverStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
confirmPassword: ${confirmPassword},
success: ${success},
loading: ${loading},
canLogin: ${canLogin},
canRegister: ${canRegister},
canForgetPassword: ${canForgetPassword}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;
  Computed<bool>? _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister,
              name: '_FormErrorStore.hasErrorsInRegister'))
      .value;
  Computed<bool>? _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_FormErrorStore.hasErrorInForgotPassword'))
      .value;

  final _$userEmailAtom = Atom(name: '_FormErrorStore.userEmail');

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  final _$passwordAtom = Atom(name: '_FormErrorStore.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$confirmPasswordAtom = Atom(name: '_FormErrorStore.confirmPassword');

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
confirmPassword: ${confirmPassword},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInRegister: ${hasErrorsInRegister},
hasErrorInForgotPassword: ${hasErrorInForgotPassword}
    ''';
  }
}
