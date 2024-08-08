import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user.dart';
import 'package:spotify/data/models/auth/signin_user.dart';


abstract class AuthFirebaseService {

  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq createUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: createUserReq.email, 
        password: createUserReq.password
      );

      return const Right('Signin was Successful');
    }
    on FirebaseAuthException catch(e) {
      String message = '';
      
      if(e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }


      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email, 
        password: createUserReq.password
      );

      FirebaseFirestore.instance.collection('Users')
      .doc(data.user?.uid)
      .set(
        {
          'name': createUserReq.fullName,
          'email': data.user?.email,
        }
      );

      return const Right('Signup was Successful');

    }
    on FirebaseAuthException catch(e) {
      String message = '';
      
      if(e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }


      return Left(message);
    }
  }

}