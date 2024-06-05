import '../model/student_model.dart';

class StudentState{
  final List <Student> lstStudent;
  final bool isLoading;

//constructor
  StudentState({
    required this.lstStudent,
    required this.isLoading,
  });

  //constructor
  factory StudentState.initial(){
    return StudentState(lstStudent: [], isLoading: false);

  }


  StudentState copyWith({ Student? student, bool? isLoading }){
    return  StudentState(
      lstStudent: student != null? [...lstStudent, student]:lstStudent,
      isLoading: isLoading ?? this.isLoading,
    ) ;

  }
}