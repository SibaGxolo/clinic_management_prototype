import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  late String uid;
  late String? name;
  late String? surname;
  late String? idNumber;
  late String? email;
  late String? collectionDay;
  late String cardNumber;
  late String password;

  late Map<String, dynamic> languages;
  late Map<String, dynamic> skills;
  late Map<String, dynamic> education;
  late Map<String, dynamic> experience;

  UserModel({required this.uid,required this.name,required this.email,required this.idNumber});

  UserModel.fromMap(Map<String, dynamic>? data){
    this.uid = data!['uid'];
    this.name = data['name'];
    this.surname = data['surname'];
    this.idNumber = data['idNumber'];
    this.email = data['email'];
    this.collectionDay = data['collectionDay'];
    this.cardNumber = data!['cardNumber'];
    this.password = data['password'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'surname' : surname,
      'idNumber': idNumber,
      'collectionDay': collectionDay,
      'email': email,
      'cardNumber': cardNumber,
      'password': password,
    };
  }
}

Future<UserModel> getUserDetails(String uid) async {

  DocumentSnapshot snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .get();

  UserModel user = UserModel.fromMap(snapshot.data() as Map<String, dynamic>);

  return user;
}