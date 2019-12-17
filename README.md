# cordova-plugin-detect-screen-recording

This plugin detects screen recording (not screenshot) event.

Supported platforms: **iOS only**.

There is **no plan to support Android** because there is no API to detect screen recording.

## Installation

```
cordova plugin add https://github.com/twogate/cordova-plugin-detect-screen-recording.git
```

## API

### isCaptured

Get current captured status.

See also: https://developer.apple.com/documentation/uikit/uiscreen/2921651-captured?language=objc

```
window.onCaptureStatusChanged.isCaptured(function(isCaptured) {
    console.log(isCaptured);
});
```

### onCaptureStatusChanged

Registers a callback function to invoke when the capture status is changed.

See also: https://developer.apple.com/documentation/uikit/uiscreencaptureddidchangenotification?language=objc

```
window.onCaptureStatusChanged.onCaptureStatusChanged(function(isCaptured) {
    console.log(isCaptured);
});
```
