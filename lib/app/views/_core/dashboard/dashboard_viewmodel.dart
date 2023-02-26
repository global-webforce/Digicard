import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/services/_core/app_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const String _numbersStreamKey = 'numbers-stream';
const String _stringStreamKey = 'string-stream';

class DashboardViewModel extends MultipleStreamViewModel {
  final _dialogService = locator<DialogService>();
  Future<DialogResponse<dynamic>?> confirmExit() async {
    return _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Exit App",
      description: "You sure you want to exit App?",
      mainButtonTitle: "Cancel",
      secondaryButtonTitle: "Exit",
      barrierDismissible: true,
    );
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _reverse = false;

  /// Indicates whether we're going forward or backward in terms of the index we're changing.
  /// This is very helpful for the page transition directions.
  bool get reverse => _reverse;

  void setIndex(int value) {
    if (value < _currentIndex) {
      _reverse = true;
    } else {
      _reverse = false;
    }
    _currentIndex = value;
    notifyListeners();
  }

  bool isIndexSelected(int index) => _currentIndex == index;

  @override
  List<ListenableServiceMixin> get listenableServices => [];

  ////
  int get number => dataMap![_numbersStreamKey];
  bool get hasNumberData => dataReady(_numbersStreamKey);

  String get randomString => dataMap![_stringStreamKey];
  bool get hasRandomString => dataReady(_stringStreamKey);

  int i = 0;
  final _appService = locator<AppService>();
  Stream<int> numbersStream([int delay = 1000]) async* {
    while (i != 10) {
      await Future.delayed(Duration(milliseconds: delay));
      yield i += 1;
    }

    print("TIMEOUT NA HAHAHA!!!");
    await _appService.logOut();
  }

  int numbersStreamDelay = 500;
  int stringStreamDelay = 2000;

  @override
  Map<String, StreamData> get streamsMap => {
        _numbersStreamKey: StreamData<int>(numbersStream(numbersStreamDelay)),
      };

  void swapStreams() {
    numbersStreamDelay -= 100;
    stringStreamDelay -= 500;
    notifySourceChanged();
  }
}
