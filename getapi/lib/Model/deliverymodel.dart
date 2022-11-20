class DeliverlistModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<dynamic>? results;

  DeliverlistModel({this.count, this.next, this.previous, this.results});

  DeliverlistModel.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    next = json["next"];
    previous = json["previous"];
    results = json["results"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    data["next"] = next;
    data["previous"] = previous;
    if (results != null) {
      data["results"] = results;
    }
    return data;
  }
}
