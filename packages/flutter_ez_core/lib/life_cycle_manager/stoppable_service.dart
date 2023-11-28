abstract class StoppableService {
  bool _serviceStoped = false;
  bool get serviceStopped => _serviceStoped;

  void stop() {
    _serviceStoped = true;
  }

  void start() {
    _serviceStoped = false;
  }
}
