//
//  WebViewController.h
//  dragon-ios-app
//
//  Created by fangyp on 2023/12/13.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebViewController : UIViewController<WKNavigationDelegate>

@property(nonatomic, strong) IBOutlet WKWebView *wkWebView;

@property (nonatomic, strong) NSString *url;

@end

NS_ASSUME_NONNULL_END
