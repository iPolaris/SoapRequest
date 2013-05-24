//
//  iPolarisViewController.h
//  soapRequest
//
//  Created by iPolaris on 13-5-24.
//  Copyright (c) 2013年 iPolaris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SoapUtil.h"
@interface iPolarisViewController : UIViewController
@property (strong) SoapUtil *soap;
@property (strong, nonatomic) IBOutlet UITextView *resultText;

@end
