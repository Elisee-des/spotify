import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class GetPlayListUseCase implements Usecase<Either, dynamic> {

  @override
  Future<Either> call({params}) async {
    return sl<SongRepository>().getPlayList();
  }

  //   @override
  // Future<Either> call({params}) async {
  //   return sl<SongRepositoryImpl>().getPlayList();
  // }

}