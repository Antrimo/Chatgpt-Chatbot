class Models{
  final String id;
  final int created;
  final String root;

  Models({
    required this.id,required this.created,required this.root
  });

  factory Models.fromJson(Map<String,dynamic> json) => Models(
    id: json["id"], 
    created: json["root"], 
    root: json["created"]
    );

  static List<Models> modelsFromSnapshot(List modelSnapshot){
    return modelSnapshot.map((data) => Models.fromJson(data)).toList();
  }
}