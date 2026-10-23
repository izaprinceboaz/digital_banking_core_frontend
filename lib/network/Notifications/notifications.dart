import 'package:digital_banking_core_frontend/network/network.dart';

class Notifications {
  final Network _network = Network();

  Future<List<dynamic>?> getMyNotifications() async {

    var response = await _network.getRequest('/notifications/my-notifications');

    if (response != null) {
      return response as List<dynamic>;
    }
    return null;
  }

  Future<bool> markAsRead({
    required String id
  }) async {

    var response = await _network.patchRequest(endpoint: '/notifications/$id/mark-as-read');

    return response != null;
  }

  Future<bool> deleteNotification({
    required String id
  }) async {

    var response = await _network.deleteRequest('/notifications/$id');

    return response != null;
  }

  Future<Map<String, dynamic>?> getPreferences() async {

    var response = await _network.getRequest('/notification-preferences/my-notification-preferences');

    if (response != null) {
      return response as Map<String, dynamic>;
    }
    return null;
  }

  // pass the map you got from getPreferences() after changing the true/false values
  Future<bool> savePreferences({
    required Map<String, dynamic> preferences
  }) async {

    var response = await _network.postRequest(
        body: preferences,
        endpoint: '/notification-preferences'
    );

    return response != null;
  }
}
