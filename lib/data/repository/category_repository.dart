import 'package:grocery/data/interfaces/i_service_api.dart';
import 'package:grocery/data/models/category.dart';
import 'package:grocery/data/network/base_api_service.dart';
import 'package:grocery/data/network/network_api_service.dart';
import 'package:grocery/presentation/services/app_data.dart';

class CategoryRepository extends IServiceAPI {
  final BaseApiServices apiServices = NetworkApiService();
  final AppData _appData;

  CategoryRepository(this._appData);

  @override
  Category convertToObject(value) {
    return Category.fromMap(value);
  }

  List<Category> getCategories() => [];
}
