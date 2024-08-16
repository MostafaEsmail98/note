class NoteModel {
  final String title ;
  final String description;
  DateTime time = DateTime.now() ;
  bool isDone ;
  int randomInt = 0 ;

  NoteModel( {this.randomInt=0,required this.title, required this.description, required this.time ,this.isDone=false});
}