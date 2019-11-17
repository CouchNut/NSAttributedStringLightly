//
//  ViewController.m
//  AttributedStringDemo
//
//  Created by Copper on 2019/11/17.
//  Copyright © 2019 AttributedStringDemo. All rights reserved.
//

#import "ViewController.h"
#import "NSAttributedString+PHC.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.label = [[UILabel alloc] init];
    self.label.numberOfLines = 0;
    self.label.frame = CGRectInset(self.view.bounds, 50, 15);
    [self.view addSubview:self.label];
    
    NSString *content = @"Red Green Blue";
    NSMutableAttributedString *attribute = NSMutableAttributedString.attributedString(content);
    attribute.phc_font([UIFont systemFontOfSize:40]).phc_textColor(UIColor.redColor);
    attribute.phc_text(@"Green").phc_textColor(UIColor.greenColor).phc_font([UIFont fontWithName:@"zapfino" size:35]);
    attribute.phc_text(@"Blue").phc_textColor(UIColor.blueColor).phc_font([UIFont fontWithName:@"Helvetica-Bold" size:30]);
    
    attribute appendAttributedString:<#(nonnull NSAttributedString *)#>
    
    self.label.attributedText = attribute;
}

@end
