import 'package:hive/hive.dart';



@HiveType(typeId: 0)
class Student extends HiveObject {
  @HiveField(0)
  final String fname;
  
  @HiveField(1)
  final String lname;

  @HiveField(1)
  final String age;
  
  @HiveField(3)
  final String city;

  Student( {required this.fname, required this.lname, required this.age, required this.city});
}
