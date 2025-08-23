

import 'package:authentication_app/data/repositories/auth/auth_repository.dart';
import 'package:authentication_app/data/repositories/auth/auth_repository_dev.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providersLocal {
  return [
    ChangeNotifierProvider.value(value: AuthRepositoryDev() as AuthRepository),
  ];
}