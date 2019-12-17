var exec = require('cordova/exec');

exports.onCaptureStatusChanged = function (success, error) {
  exec(success, error, "DetectScreenRecording", "onCaptureStatusChanged");
};

exports.isCaptured = function (success, error) {
  exec(success, error, "DetectScreenRecording", "isCaptured");
};
