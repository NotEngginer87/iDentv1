import 'package:hive/hive.dart';
part 'monster.g.dart';

@HiveType(typeId: 0)
class Monster{
  @HiveField(0)
  String? nama;
  @HiveField(1)
  String? asal;
  @HiveField(2)
  String? urlgambar;


  Monster(this.nama, this.asal, this.urlgambar);

}