import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DashboardViewModel extends BaseViewModel {
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
}
