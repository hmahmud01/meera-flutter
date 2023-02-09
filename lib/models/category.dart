class Category {
  int id;
  String title;
  String thumbImage;

  Category({this.id, this.title, this.thumbImage});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbImage = json['thumb_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumb_image'] = this.thumbImage;
    return data;
  }
}