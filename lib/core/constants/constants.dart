enum DeviceType { mobile, tablet, web }

class Constants {
  DeviceType _deviceType = DeviceType.mobile;

  void setDeviceType(DeviceType deviceType) {
    _deviceType = deviceType;
  }

  DeviceType get deviceType => _deviceType;
}
