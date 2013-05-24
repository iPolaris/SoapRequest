//
//  iPolarisViewController.m
//  soapRequest
//
//  Created by iPolaris on 13-5-24.
//  Copyright (c) 2013年 iPolaris. All rights reserved.
//

#import "iPolarisViewController.h"

@interface iPolarisViewController ()

@end

@implementation iPolarisViewController
@synthesize soap = _soap;
- (void)viewDidLoad
{
    [super viewDidLoad];
	_soap = [[SoapUtil alloc]initWithNameSpace:@"http://WebXml.com.cn/" andEndpoint:@"http://www.webxml.com.cn/WebServices/TranslatorWebService.asmx"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSDictionary *param1 = [NSDictionary dictionaryWithObject:@"hello" forKey:@"Word"];
//        NSDictionary *param2 = [NSDictionary dictionaryWithObject:@"103873" forKey:@"userid"];
        NSArray *array = [NSArray arrayWithObjects:param1, nil];
        NSData *resultData = [_soap requestMethod:@"getEnCnTwoWayTranslator" withDate:array];
        if (resultData) {
            //NSLog(@"Response: %@", result);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSString *resultStr = [[NSString alloc] initWithData: resultData encoding:NSUTF8StringEncoding];
                self.resultText.text = resultStr;
            });
        }
    });

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
