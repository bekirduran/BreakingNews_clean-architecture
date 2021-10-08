import '/../src/domain/entities/source.dart';

class SourceModel extends Source {

  SourceModel({required String id, required String name}) : super(id, name);
  factory SourceModel.fromJson(Map<String,dynamic> json){
    return SourceModel(
      id: json['id'].toString(),
      name: json['name'].toString()
    );
  }
}
