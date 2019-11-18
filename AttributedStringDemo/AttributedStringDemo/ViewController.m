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
    
    content = @"包含重复内容的字符串：Repeat， Repeat，Repeat，Repeat，Repeat";
    NSMutableAttributedString *secondAtt = NSMutableAttributedString.attributedString(content);
    secondAtt.phc_font([UIFont systemFontOfSize:20]).phc_textColor(UIColor.greenColor);
    secondAtt.phc_text(@"Repeat").phc_textColor(UIColor.redColor);
    secondAtt.phc_local(@(2)).phc_textColor(UIColor.blueColor);
    secondAtt.phc_local(@(3)).phc_textColor(UIColor.brownColor);
    [attribute appendAttributedString:secondAtt];
    self.label.attributedText = attribute;
}


@end
