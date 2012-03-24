//
//  OCViewController.m
//  OCPDFGen
//
//  Created by Oliver Rickard on 3/18/12.
//  Copyright (c) 2012 UC Berkeley. All rights reserved.
//

#import "OCViewController.h"
#import "OCPDFGenerator.h"

@interface OCViewController ()

@end

@implementation OCViewController


- (void)loadView {
    [super loadView];
    
    
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    //Use the below code for HTML
    NSString *readmePath = [[NSBundle mainBundle] pathForResource:@"test.html" ofType:nil];
	NSString *html = [NSString stringWithContentsOfFile:readmePath encoding:NSUTF8StringEncoding error:NULL];
    
    NSString *path = [OCPDFGenerator generatePDFFromHTMLString:html];
    
    //This is for Markdown
//    NSString *readmePath = [[NSBundle mainBundle] pathForResource:@"test2.md" ofType:nil];
//	NSString *md = [NSString stringWithContentsOfFile:readmePath encoding:NSUTF8StringEncoding error:NULL];
//    
//    NSString *path = [OCPDFGenerator generatePDFFromMarkDownString:md];
    
    NSLog(@"FileExists:%d", [[NSFileManager defaultManager] fileExistsAtPath:path]);
    
    NSURL *targetURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
    [webView release];
	
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
