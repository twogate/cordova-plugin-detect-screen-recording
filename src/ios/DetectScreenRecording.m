#import <Cordova/CDVPlugin.h> // this already includes Foundation.h
#import "DetectScreenRecording.h"

@implementation DetectScreenRecording
@synthesize captureStatusCallbackId;

- (void)pluginInitialize {
  NSLog(@"DetectScreenRecording initialize");

  NSNotificationCenter* center = [NSNotificationCenter defaultCenter];

  if (@available(iOS 11.0, *)) {
    [center
      addObserver:self
      selector:@selector(capturedDidChange:)
      name:UIScreenCapturedDidChangeNotification object:nil];
  }
}

- (void)capturedDidChange:(NSNotification*)notification {
  BOOL isCaptured = [UIScreen mainScreen].isCaptured;
  NSLog(@"Captured Did Change: %s", isCaptured ? "true" : "false");

  if (self.captureStatusCallbackId != nil) {
    NSLog(@"On callback: %s", isCaptured ? "true" : "false");
    CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isCaptured];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.captureStatusCallbackId];
  }
}

- (void)onCaptureStatusChanged:(CDVInvokedUrlCommand *)command {
  self.captureStatusCallbackId = command.callbackId;

  // send initial state
  BOOL isCaptured = [UIScreen mainScreen].isCaptured;
  CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isCaptured];
  [pluginResult setKeepCallbackAsBool:YES];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)isCaptured:(CDVInvokedUrlCommand *)command {
  BOOL isCaptured = [UIScreen mainScreen].isCaptured;
  CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isCaptured];
  [pluginResult setKeepCallbackAsBool:YES];
  [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}
@end
