

import 'dart:ffi';

class HandleError{


static String firebaseErrorHandle(e){
  if (e.code == 'email-already-in-use') {
    return'The account already exists for that email.';
  } else if (e.code == 'invalid-email') {
    return 'The email address is invalid.';
  } else if (e.code == 'weak-password') {
    return'The password is too weak.' ;
  }
  return 'An unknown error occurred';
}

}
