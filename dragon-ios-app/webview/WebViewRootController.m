//
//  WebViewRootController.m
//  dragon-ios-app
//
//  Created by fangyp on 2024/2/28.
//

#import "WebViewRootController.h"
#import "WebViewController.h"
#import "MBProgressHUD.h"

@interface WebViewRootController ()<UITextViewDelegate>

@end

@implementation WebViewRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"WebView"];
    // Do any additional setup after loading the view.
    [self.textView setBackgroundColor:[UIColor whiteColor]];
    self.textView.delegate = self;
    self.textView.text = @"";
    self.textView.layer.borderWidth = 0.5;
    self.textView.layer.borderColor =[UIColor colorWithRed:235/255 green:235/255 blue:235/255 alpha:0.5].CGColor;
    self.textView.layer.cornerRadius = 10;
    
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

#pragma  IBAction mehtod
//选择发布范围
- (IBAction) onVisitWebsideAction:(id)sender {
    if(![self.textView.text isEqualToString:@""]) {
        WebViewController *webContoller = [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:Nil];
        [webContoller setUrl:self.textView.text];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self.navigationController pushViewController:webContoller animated:YES];
    }else {
        // 在当前视图上显示简单文字提示
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.label.text = @"请输入要访问的链接";
        [hud hideAnimated:YES afterDelay:2.0];
    }
}

- (IBAction) onClearAction:(id)sender {
    self.textView.text = @"";
}

@end
