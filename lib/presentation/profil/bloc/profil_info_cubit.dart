import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/auth/get_user.dart';
import 'package:spotify/presentation/profil/bloc/profil_info_state.dart';
import 'package:spotify/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {

  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {

    var user = await sl<GetUserUsecase>().call();

    user.fold(
      (l) {
        emit(ProfileInfoFailure());
      } , 
      
      (userEntity) {
        ProfileInfoLoaded(
          userEntity: userEntity
        );
      }
      
      );

  }
  
  }