import 'package:scoped_model/scoped_model.dart';

abstract class BaseModel extends Model {
  bool _loading = true;

  void setLoading(bool state) {
    _loading = state;
    notifyListeners();
  }

  bool get isLoading => _loading;

  Future fetchData();
}
