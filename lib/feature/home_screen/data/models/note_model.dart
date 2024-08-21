
import 'package:hive/hive.dart';

part 'note_model.g.dart';
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title ;
  @HiveField(1)
  final String description;
  @HiveField(2)
  String time = DateTime.now().toString() ;
  @HiveField(3)
  bool isDone ;
  @HiveField(4)
  double randomInt = 0 ;

  NoteModel( {this.randomInt=0,required this.title, required this.description, required this.time ,this.isDone=false});
}