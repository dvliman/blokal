import 'package:scoped_model/scoped_model.dart';

abstract class BaseModel extends Model {
  String baseUrl = "http://localhost:3000";

  String endpoint(String suffix) {
    return "$baseUrl/$suffix";
  }

  bool _loading = true;
  bool get isLoading => _loading;
  void setLoading(bool state) {
    _loading = state;
    notifyListeners();
  }

  Future fetchData();

  Future refresh() async {
    fetchData();
    notifyListeners();
  }
}
