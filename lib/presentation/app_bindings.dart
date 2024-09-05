import 'package:get/get.dart';
import 'package:tractian/data/data.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/infra/infra.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() async {
    Get.put<ILocalStorageUseCase>(LocalStorageUseCase(), permanent: true);
    Get.put<Http>(
      HttpClient(
        baseUrl: 'https://fake-api.tractian.com',
        interceptors: [
          CacheInterceptor(localStorage: Get.find()),
        ],
      ),
      permanent: true,
    );
  }
}
