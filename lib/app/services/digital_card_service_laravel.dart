import 'dart:async';
import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/api/api_endpoints.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';
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
                  ownerId: index + 1,
                  title: fkr.faker.conference.name(),
                  logoImage: fkr.faker.randomGenerator.element([
                    "https://globalwebforce.com/wp-content/uploads/2021/06/cropped-nav-logo.png",
                    "https://upload.wikimedia.org/wikipedia/en/7/72/New_Mobile_Legends_Bang_Bang_2020_Logo.png"
                        "https://cdn1.designhill.com/assets/dh/images/infographic/master_card.png?ver=2.12.40",
                    "https://brandslogos.com/wp-content/uploads/thumbs/famous-amos-logo-vector.svg",
                    "https://99designs-blog.imgix.net/blog/wp-content/uploads/2022/05/Shell_logo.svg-e1659037248878.png?auto=format&q=60&fit=max&w=930"
                        "https://global-uploads.webflow.com/5e157548d6f7910beea4e2d6/611e17ec949adb702e521eb5_4Em9cry00PqgpP_mCCrgJ_OmdqSMCzQVgEYtfvDrfM3eBL3zBMvBZ4TxXHUVdgXWiwySmgYSFXmKx86BS10Yk2fVQhKTFOXTYlxKPsII1HBYjkvQ3d14PFsOfFbk51boJMEI6Ns7.png"
                  ]),
                  profileImage: fkr.faker.image.image(
                    random: true,
                    width: 700,
                  ),
                  prefix: fkr.faker.person.prefix(),
                  firstName: fkr.faker.person.firstName(),
                  middleName: fkr.faker.person.lastName(),
                  lastName: fkr.faker.person.lastName(),
                  suffix: fkr.faker.person.suffix(),
                  shortBio: fkr.faker.lorem.sentences(5).join(" "),
                  position: fkr.faker.company.position(),
                  company: fkr.faker.company.name(),
                  email: fkr.faker.internet.email(),
                  address: fkr.faker.address.city(),
                  mobileNumber: fkr.faker.phoneNumber.us(),
                  website: fkr.faker.internet.httpsUrl(),
                  goesBy: fkr.faker.person.name(),
                  color: fkr.random.element([
                    0xffb74093,
                    0xffb74093,
                    0xffb74093,
                  ]),
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
  }
}
