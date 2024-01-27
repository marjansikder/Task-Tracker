class TaskListResponse {
  int? _count;
  List<TaskData>? _data;

  TaskListResponse({int? count, List<TaskData>? data}) {
    if (count != null) {
      this._count = count;
    }
    if (data != null) {
      this._data = data;
    }
  }

  int? get count => _count;
  set count(int? count) => _count = count;
  List<TaskData>? get data => _data;
  set data(List<TaskData>? data) => _data = data;

  TaskListResponse.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['data'] != null) {
      _data = <TaskData>[];
      json['data'].forEach((v) {
        _data!.add(new TaskData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskData {
  bool? _completed;
  String? _sId;
  String? _title;
  String? _description;
  String? _dueDate;
  String? _owner;
  String? _createdAt;
  String? _updatedAt;
  int? _iV;

  TaskData(
      {bool? completed,
        String? sId,
        String? title,
        String? description,
        String? dueDate,
        String? owner,
        String? createdAt,
        String? updatedAt,
        int? iV}) {
    if (completed != null) {
      this._completed = completed;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (title != null) {
      this._title = title;
    }
    if (description != null) {
      this._description = description;
    }
    if (dueDate != null) {
      this._dueDate = dueDate;
    }
    if (owner != null) {
      this._owner = owner;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  bool? get completed => _completed;
  set completed(bool? completed) => _completed = completed;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  String? get dueDate => _dueDate;
  set dueDate(String? dueDate) => _dueDate = dueDate;
  String? get owner => _owner;
  set owner(String? owner) => _owner = owner;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  TaskData.fromJson(Map<String, dynamic> json) {
    _completed = json['completed'];
    _sId = json['_id'];
    _title = json['title'];
    _description = json['description'];
    _dueDate = json['dueDate'];
    _owner = json['owner'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completed'] = this._completed;
    data['_id'] = this._sId;
    data['title'] = this._title;
    data['description'] = this._description;
    data['dueDate'] = this._dueDate;
    data['owner'] = this._owner;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['__v'] = this._iV;
    return data;
  }
}