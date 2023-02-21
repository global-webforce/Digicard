import 'dart:async';
import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/api/api_endpoints.dart';
import 'package:digicard/app/models/digital_card.model.dart';
import 'package:digicard/features/create_card/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:faker/faker.dart' as fkr;

class DigitalCardServiceLaravel
    with ListenableServiceMixin
    implements DigitalCardService {
  final _apiService = locator<ApiService>();

  DigitalCardServiceLaravel() {
    listenToReactiveValues([
      _digitalCards,
    ]);
  }

  final ReactiveValue<List<DigitalCard>> _digitalCards =
      ReactiveValue<List<DigitalCard>>([]);

  @override
  Future create(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.instance.addService(),
      requestBody: formData,
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    );
  }

  @override
  Future delete(int? id) async {
    digitalCards.removeWhere((e) => e.id == id);
    notifyListeners();
    /*  await _apiService.delete(
      ApiEndpoints.instance.deleteService(id),
      onSuccess: (res) async {
        await getAll();
      },
      onError: (_) {},
    ); */
  }

  @override
  Future getAll() async {
    await _apiService.get(
      ApiEndpoints.instance.notifications(),
      onSuccess: (res) async {
        _digitalCards.value = List.generate(
            10,
            (index) => DigitalCard(
                  id: index,
                  userId: index + 1,
                  name: fkr.faker.person.name(),
                  company: fkr.faker.company.name(),
                  title: fkr.faker.company.position(),
                  email: fkr.faker.internet.email(),
                  image: fkr.faker.image.image(random: true),
                  mobileNumber: fkr.faker.phoneNumber.us(),
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                ));
      },
      onError: (_) {},
    );
  }

  @override
  List<DigitalCard> get digitalCards => _digitalCards.value;

  @override
  duplicate(DigitalCard digitalCard) {
    int index = digitalCards.indexWhere((e) => e.id == digitalCard.id);
    digitalCards.insert(index + 1,
        digitalCard.copyWith(id: DateTime.now().millisecondsSinceEpoch));
    notifyListeners();
  }
}
