import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return {
      'pt_BR': {
        'search': 'Buscar Ativo ou Local',
        'sensor': 'Sensor de Energia',
        'menu_asset': 'Assets',
        'try_again': 'Tentar novamente',
        'error_loading_companies': 'Erro ao carregar empresas',
        'error_loading_assets': 'Erro ao carregar componentes',
        'energy_sensor': 'Sensor de Energia',
        'alert_type': 'Crítico',
        'empty_list': 'Sem dados',
      },
    };
  }
}
