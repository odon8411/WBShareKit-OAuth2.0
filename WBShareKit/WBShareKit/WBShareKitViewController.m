//
//  WBShareKitViewController.m
//  WBShareKit
//
//  Created by Gao Semaus on 11-8-8.
//  Copyright 2011年 Chlova. All rights reserved.
//

#import "WBShareKitViewController.h"
#import "CHShareManager.h"

@implementation WBShareKitViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	NSString *path = [[NSBundle mainBundle] pathForResource:@"libopencore" ofType:@"a"];
	NSLog(@"path = %@",path);
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -

- (IBAction)sinaSend:(id)sender {
    if (![[CHShareManager mainManager] sinaIsVailed]) {
		NSLog(@"show login");
        [[CHShareManager mainManager] showLoginOnViewController:self type:@"sina" finish:@selector(logInDidFinished:) failed:@selector(logInDidFailed:Error:)];
    }
    else{
		NSLog(@"send wei bo");
        [[CHShareManager mainManager] sendWeibo:@"WBShareKit test1" image:[UIImage imageNamed:@"WBShareKit.png"] type:@"sina" vc:self finish:@selector(sendDidFinished:) failed:@selector(sendDidError:)];
    }
    
}

- (IBAction)qqSend:(id)sender {
    if (![[CHShareManager mainManager] qqIsVailed]) {
		NSLog(@"show login");
        [[CHShareManager mainManager] showLoginOnViewController:self type:@"qq" finish:@selector(logInDidFinished:) failed:@selector(logInDidFailed:error:)];
    }
    else
    {
		NSLog(@"send wei bo");
        [[CHShareManager mainManager] sendWeibo:@"WBShareKit test" image:[UIImage imageNamed:@"WBShareKit.png"] type:@"qq" vc:self finish:@selector(sendDidFinished:) failed:@selector(sendDidError:)];
    }
}

#pragma mark - api delegate
- (void)logInDidFinished:(WBEngine *)_engine
{
	NSLog(@"登陆成功");
//    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"登录成功" message:_engine.snsType delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
//    [al show];
//    [al release];
}

- (void)logInDidFailed:(WBEngine *)_engine error:(NSError *)_error
{
	NSLog(@"登陆失败error＝%@",_error);
	UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"登录失败" message:_engine.snsType delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [al show];
    [al release];
}

- (void)sendDidFinished:(id)_result
{
    NSLog(@"send did finished:%@",_result);
	UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"发送成功" message:@"发送成功" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [al show];
    [al release];
}

- (void)sendDidError:(NSError *)_error
{
	
    NSLog(@"sendDidError　＝　%@",_error);
	UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"发送失败" message:@"发送失败" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    [al show];
    [al release];
}
@end
