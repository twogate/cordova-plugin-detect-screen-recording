#import <Cordova/CDVPlugin.h> // this already includes Foundation.h

#ifndef DetectScreenRecording_h
#define DetectScreenRecording_h

@interface DetectScreenRecording : CDVPlugin
- (void)pluginInitialize;
- (void)onCaptureStatusChanged:(CDVInvokedUrlCommand *)command;
- (void)isCaptured:(CDVInvokedUrlCommand *)command;
@property (nonatomic, copy) NSString *captureStatusCallbackId;
@end

#endif /* DetectScreenRecording_h */
