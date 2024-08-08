import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/service_locator.dart';

class AddOrRemoveSongUseCase implements Usecase<Either, String> {

  @override
  Future<Either> call({String ? params}) async {
    return sl<SongRepository>().addOrRemoveFavoriteSongs(params!);
  }

}