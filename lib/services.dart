import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class service{


  FirebaseUser user;
  Future<void>addPersonalData(userData,String email)async{
      Firestore.instance.collection('Personal Data').document('$email').setData(userData).catchError((e){
        print(e);
      });
  }

  Future<void>addBookingData(userData, String email) async {
    Firestore.instance.collection('Booking Data').document('$email').setData(userData).catchError((e){
      print(e);
    });
  }

  Future<void>updatePkgData(pkgData, String id)async{
    Firestore.instance.collection('Packages Data').document(id).setData(pkgData).catchError((e){
      print(e);
    });
  }


  getpersonaldata()async{
    return await Firestore.instance.collection("Personal Data").getDocuments();
  }
  getbookingdata()async{
    return await Firestore.instance.collection("Booking Data").getDocuments();
  }
  getpackagedata()async{
    return await Firestore.instance.collection("Packages Data").getDocuments();
  }

}