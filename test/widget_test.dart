import 'package:flutter_test/flutter_test.dart';

import 'package:ciervo_landing/core/constants/app_constants.dart';
import 'package:ciervo_landing/core/constants/seo_constants.dart';

void main() {
  test('Ciervo Club brand constants are configured', () {
    expect(AppConstants.brandName, 'Ciervo Club');
    expect(AppConstants.logoName, 'CIERVO');
    expect(AppConstants.legalEntityName, isNotEmpty);
    expect(AppConstants.operatingCountry, 'Colombia');
    expect(SeoConstants.homeTitle, contains('Ciervo Club'));
  });
}
