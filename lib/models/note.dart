class Note {
  int _id;
  String _title;
  String _description;
  String _quantity;
  String _date;
  int _priority;

  Note(this._title, this._date, this._priority, this._description,
      this._quantity);

  Note.withId(this._title, this._date, this._priority, this._description,
      this._quantity);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get quantity => _quantity;

  int get priority => _priority;

  String get date => _date;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      this._title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      this._description = newDescription;
    }
  }

  set quantity(String newQuantity) {
    if (newQuantity.length <= 255) {
      this._quantity = newQuantity;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 1 && newPriority <= 2) {
      this._priority = newPriority;
    }
  }

  set date(String newDate) {
    this._date = newDate;
  }

  // Convert a Note object into a Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['quantity'] = _quantity;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._quantity = map['quantity'];
    this._priority = map['priority'];
    this._date = map['date'];
  }
}
