import 'package:book_store_manager/repositories/services/import_service.dart';

import '../models/import_product_model.dart';

class ImportRepository {
  late ImportService _importService;

  ImportRepository() {
    _importService = ImportService();
  }

  Future<List<ImportProductModel>> getInportHistory(DateTime time) async {
    return _importService.getInportHistory(time);
  }
}
