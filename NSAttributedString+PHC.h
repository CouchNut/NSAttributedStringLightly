//
//  NSAttributedString+PHC.h
//  PhotoCam
//
//  Created by Copper on 2019/10/22.
//  Copyright © 2019 PhotoCam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSMutableAttributedString *_Nullable (^PHCSingleStringBlock)(NSString *string);
typedef NSMutableAttributedString *_Nullable (^PHCSingleAttributeValueBlock)(id value);

@interface NSMutableAttributedString (PHC)

+ (PHCSingleStringBlock)attributedString;

/// 传值为 NSString 类型，如果传入 nil 或 @"", 则当前的 operaString 为整个文字内容
- (PHCSingleStringBlock)phc_text;

/// 传值为 UIFont 类型
- (PHCSingleAttributeValueBlock)phc_font;

/// 传值为 NSNumber（整数）类型， 取值范围是 NSUnderlineStyle 枚举中的值
- (PHCSingleAttributeValueBlock)phc_underlineStyle;

/// 传值为 UIColor 类型
- (PHCSingleAttributeValueBlock)phc_underlineColor;

/// 传值为 UIColor 类型
- (PHCSingleAttributeValueBlock)phc_textColor;

/// 传值为 UIColor 类型
- (PHCSingleAttributeValueBlock)phc_textBackgroundColor;

/// 传值为 UIColor 类型
- (PHCSingleAttributeValueBlock)phc_strokeColor;

/// 传值为 NSNumber（整数）类型，负值填充效果，正值中空效果
- (PHCSingleAttributeValueBlock)phc_strokeWidth;

/// 传值为 NSParagraphStyle 对象，段落排版格式
- (PHCSingleAttributeValueBlock)phc_paragraphStyle;

/// 传值为 NSNumber（整数）类型，0 表示没有连体字符，1 表示使用默认的连体字符
- (PHCSingleAttributeValueBlock)phc_ligature;

/// 传值为 NSNumber（整数）类型
- (PHCSingleAttributeValueBlock)phc_strikethroughStyle;

/// 传值为 NSString 对象
- (PHCSingleAttributeValueBlock)phc_textEffect;

/// 传值为 NSTextAttachment 对象，常用于文字图片混排
- (PHCSingleAttributeValueBlock)phc_attachment;

/// 传值 NSURL (preferred) or NSString 对象，点击后调用浏览器打开指定URL地址
- (PHCSingleAttributeValueBlock)phc_link;

/// 传值 NSNumber（float）, 正值上偏，负值下偏
- (PHCSingleAttributeValueBlock)phc_baselineOffset;

/// 传值为 UIColor 类型
- (PHCSingleAttributeValueBlock)phc_strikethroughColor;

/// 设置文字书写方向，从左向右书写或者从右向左书写
- (PHCSingleAttributeValueBlock)phc_writingDirection;

/// 传值为 NSNumber（float）类型，设置文本横向拉伸属性，正值横向拉伸文本，负值横向压缩文本
- (PHCSingleAttributeValueBlock)phc_expansion;

/// 传值为 NSNumber（整数）类型，设置文字排版方向，0 表示横排文本，1 表示竖排文本
- (PHCSingleAttributeValueBlock)phc_verticalGlyphForm;

/// 传值为 NSNumber（整数）类型，设置字符间距，正值间距加宽，负值间距变窄
- (PHCSingleAttributeValueBlock)phc_kern;

/// 传值为 NSNumber （float）类型，设置字形倾斜度，正值右倾，负值左倾
- (PHCSingleAttributeValueBlock)phc_obliqueness;

/// 传值为 NSShadow 类型，设置阴影属性
- (PHCSingleAttributeValueBlock)phc_shadow;

@end

NS_ASSUME_NONNULL_END
