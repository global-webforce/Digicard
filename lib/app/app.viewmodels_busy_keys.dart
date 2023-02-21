class ViewModelBusyKeys {
  static final ViewModelBusyKeys _instance = ViewModelBusyKeys._();
  ViewModelBusyKeys._();
  static ViewModelBusyKeys get instance {
    return _instance;
  }

  static const String userProfileUpdate = "user-profile-update";
  static const String appointmentBooking = 'appointment-booking-key';
  static const String credentialDelete = 'credential-delete';
  static const String offeredServiceDelete = 'offered-service-delete';
  static const String scheduleDelete = 'schedule-delete';
  static const String taskAlarmUpdate = 'task-alarm-update';
  static const String taskAlarmDelete = 'task-alarm-delete';
  static const String appointmentUpdate = 'appointment-update';
}
