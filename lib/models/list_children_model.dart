class ListChildrenModel {
  String? nom;
  String? prenom;
  String? comportement;
  String? age;
  String? img;
  String? imgName;
  Parent? parent;
  ChildGroup? childGroup;
  List<Attendances>? attendances;
  ListChildrenModel(
      {this.nom,
      this.prenom,
      this.comportement,
      this.age,
      this.img,
      this.imgName,
      this.parent,
      this.childGroup,
      this.attendances});
  ListChildrenModel.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    comportement = json['comportement'];
    age = json['age'];
    img = json['img'];
    imgName = json['imgName'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    childGroup = json['childGroup'] != null
        ? new ChildGroup.fromJson(json['childGroup'])
        : null;
    if (json['attendances'] != null) {
      attendances = <Attendances>[];
      json['attendances'].forEach((v) {
        attendances!.add(new Attendances.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['comportement'] = this.comportement;
    data['age'] = this.age;
    data['img'] = this.img;
    data['imgName'] = this.imgName;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    if (this.childGroup != null) {
      data['childGroup'] = this.childGroup!.toJson();
    }
    if (this.attendances != null) {
      data['attendances'] = this.attendances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Parent {
  String? nom;
  String? prenom;
  String? email;
  String? telephone;
  Parent({this.nom, this.prenom, this.email, this.telephone});
  Parent.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    telephone = json['telephone'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    return data;
  }
}
class ChildGroup {
  String? name;
  int? id;
  ChildGroup({this.name, this.id});
  ChildGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
class Attendances {
  int? id;
  String? date;
  bool? presence;
  Attendances({this.id, this.date, this.presence});
  Attendances.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    presence = json['presence'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['presence'] = this.presence;
    return data;
  }
}









