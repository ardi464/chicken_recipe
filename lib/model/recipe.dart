class Recipe {
  int idrecipe;
  int idapp;
  String title;
  String time;
  String img;
 
  Recipe({this.idrecipe, this.idapp, this.title, this.time,this.img});
 
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      idrecipe: json["id_recipe"] as int,
      idapp: json["id_app"] as int,
      title: json["title"] as String,
      time: json["time"] as String,
      img: json["img"] as String,
    );
  }
}
