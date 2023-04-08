/* import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/services/_core/app_service.dart';

class ApiEndpoints {
  static final ApiEndpoints _instance = ApiEndpoints._();

  ApiEndpoints._();
  static ApiEndpoints get instance {
    return _instance;
  }

  final userId = locator<AppService>().session?.user.id;

  static const String baseUrl = "https://app.wellnesshubaustralia.com/api";

  static const String login = "$baseUrl/login";
  static const String register = "$baseUrl/register";
  String verifyUserByCode() => "$baseUrl/update-company-code/$userId";
  String userProfile() => "$baseUrl/user/$userId";

  String pillarsProgressEndpoint() => "$baseUrl/progress/$userId";

  static const String pillars = "$baseUrl/pillars-API";
  static const String customLinks = "$baseUrl/custom-links";

  static const String createAppointment = "$baseUrl/create-appointment";
  String updateAppointment(int? appointmentId) =>
      "$baseUrl/update-appointment/$appointmentId";
  String clientAppointment() => "$baseUrl/member/$userId/get-appointment";
  String serviceProviderAppointment() =>
      "$baseUrl/service-provider/$userId/get-appointment";

  String badges() => "$baseUrl/badges/$userId";

  String messages() => "$baseUrl/user/$userId/messages/get-threads";
  String messageThreadViaThreadId(int? threadId) =>
      "$baseUrl/user/$userId/messages/$threadId";
  String messageThreadViaRecipientId(int? recipientId) =>
      "$baseUrl/user/$userId/get-thread/$recipientId";
  String messageSend(int? threadId, int? recipientId) {
    if (threadId != null) {
      return "$baseUrl/send-message/$userId/$threadId";
    } else {
      return "$baseUrl/send-message/$userId";
    }
  }

  String companies() => "$baseUrl/custom-links";
  static const String companyMembers = "$baseUrl/custom-links";

  String addCredential() => "$baseUrl/service-provider/credential/add/$userId";

  String credentials() => "$baseUrl/service-provider/$userId/credentials";

  String deleteCredential(int? id) =>
      "$baseUrl/service-provider/credential/remove/$id";

  static const String fields = "$baseUrl/fields";

  String services() => "$baseUrl/service-provider/$userId/fields";
  String addService() => "$baseUrl/service-provider/field/assign/$userId";
  String deleteService(int? id) => "$baseUrl/service-provider/field/remove/$id";

  String notifications() => "$baseUrl/notifications/$userId";
  String notificationDelete(int? id) => "$baseUrl/notifications/$id";

  static const String serviceProviders = "$baseUrl/service-providers";
  String serviceProvider() => "$baseUrl/service-providers/$userId";

  String addSchedule() => "$baseUrl/service-provider/schedule/add/$userId";
  String updateSchedule() => "$baseUrl/service-provider/schedule/add/$userId";
  String deleteSchedule(int? id) =>
      "$baseUrl/service-provider/schedule/remove/$id";
  String schedules() => "$baseUrl/service-provider/$userId/schedules";

  String tasks() => "$baseUrl/tasks/$userId";
  String undoFinishedTask(int? id) => "$baseUrl/taskprogress/$id";
  String finishTask() => "$baseUrl/taskprogress";

  String addAlarm() => "$baseUrl/alarm";
  String updateAlarm(int? id) => "$baseUrl/alarm/$id";
  String deleteAlarm(int? id) => "$baseUrl/alarm/$id";
}
 */