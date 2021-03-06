class Note {
  int _id;
  String _title;
  String _description;
  String _quantity;
  String _price;
  String _date;

  Note(this._title, this._date, this._description, this._quantity, this._price);

  Note.withId(
      this._title, this._date, this._description, this._quantity, this._price);

  int get id => _id;

  String get title => _title;

  String get description => _description;

  String get quantity => _quantity;

  String get price => _price;

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

  set price(String newPrice) {
    if (newPrice.length <= 255) {
      this._price = newPrice;
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
    map['price'] = _price;
    map['date'] = _date;

    return map;
  }

  // Extract a Note object from a Map object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._quantity = map['quantity'];
    this._price = map['price'];
    this._date = map['date'];
  }
}
