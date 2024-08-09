import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user.dart';
import 'package:spotify/data/models/auth/signin_user.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signUserReq) async {
    return await sl<AuthFirebaseService>().signin(signUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }
  
  @override
  Future<Either> getUser() async{
      return await sl<AuthFirebaseService>().getUser();
  }
}
