import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/cupertino.dart';

mixin RequestPermissionsTemplateMixin {
  Future<void> requestTrackActivityPermission() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    late String authStatus;

    switch (status) {
      case TrackingStatus.notDetermined:
        final requestStatus =
        await AppTrackingTransparency.requestTrackingAuthorization();
        authStatus = 'TRACK STATUS: $requestStatus';
        break;
      case TrackingStatus.restricted:
        authStatus = 'TRACK STATUS: Restricted';
        break;
      case TrackingStatus.denied:
        authStatus = 'TRACK STATUS: Denied';
        break;
      case TrackingStatus.authorized:
        authStatus = 'TRACK STATUS: Authorized';
        break;
      case TrackingStatus.notSupported:
        authStatus = 'TRACK STATUS: Not Supported';
        break;
    }

    debugPrint('TRACK STATUS: $authStatus');

    await AppTrackingTransparency.getAdvertisingIdentifier();
  }
}