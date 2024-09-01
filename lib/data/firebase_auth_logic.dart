import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_2024/domin/shared/components/constants.dart';
import 'package:firebase_auth_2024/domin/shared/network/local/cache_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
//firebase_storage: ^11.2.5

class ServiceAuth {

  void firebaseAuth() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  /* ************************ Get User ********************** */
  Future<User?> getUser() async {
     //uID;
    var users = FirebaseAuth.instance;

    var user = FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user != null) {
        print(user.uid);
        print(user.phoneNumber);
      }
    });
   // print("user : ${idToken}");
    return users.currentUser;
  }



  /* ************************ Sign Up ********************** */

  Future<User?> createUserWithAdditionalInfo(
      {required String email,
        required String password,
        required int age,
        required String phoneNumber}) async {
      //  إنشاء حساب مستخدم
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // التحقق من نجاح عملية إنشاء الحساب
      if (userCredential == null) {
        return null; // أو إرجاع قيمة تشير إلى فشل العملية
      }

      User? user = userCredential.user;

      // انشاء وتخزين في فايرستور
      CollectionReference usersFirestore = FirebaseFirestore.instance.collection('users');
      usersFirestore
          .add({
        'full_name': "fullName", // John Doe
        'company': "company", // Stokes and Sons
        'age': age // 42
      })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));


      return user;

    // on FirebaseAuthException catch(e){
    //   if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   } else if (e.code == 'invalid-email') {
    //     print('The email address is invalid.');
    //   } else if (e.code == 'weak-password') {
    //     print('The password is too weak.');
    //   } else {
    //     print('An unknown error occurred.');
    //   }
    //   return null;
    // }

  }


  /* ************************ Log In ********************** */

  Future<User?> signInWithEmailAndPassword({required String email ,required String password}) async {
    UserCredential userCredential = await
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    );

    print(userCredential.user!.uid);
    print(userCredential.user!.email);


    return userCredential.user;

  }



}
