//
//  WebViewRootController.h
//  dragon-ios-app
//
//  Created by fangyp on 2024/2/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewRootController : UIViewController

@property (strong, nonatomic) IBOutlet UITextView *textView;

// goto webview
- (IBAction) onVisitWebsideAction:(id)sender;

// goto webview
- (IBAction) onClearAction:(id)sender;

@end

NS_ASSUME_NONNULL_END
