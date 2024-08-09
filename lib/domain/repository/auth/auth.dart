import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user.dart';
import 'package:spotify/data/models/auth/signin_user.dart';

abstract class AuthRepository {

  Future<Either> signin (SigninUserReq signUserReq);
  
  Future<Either> signup (CreateUserReq createUserReq);

  Future<Either> getUser ();
}