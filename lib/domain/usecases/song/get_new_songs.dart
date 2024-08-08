import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/repository/song/song_repository_impl.dart';
import 'package:spotify/service_locator.dart';

class GetNewsSongsUseCase implements Usecase<Either, dynamic> {

  @override
  Future<Either> call({params}) async {
    return sl<SongRepositoryImpl>().getNewsSongs();
  }

}