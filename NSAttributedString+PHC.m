//
//  NSAttributedString+PHC.m
//  PhotoCam
//
//  Created by Copper on 2019/10/22.
//  Copyright © 2019 PhotoCam. All rights reserved.
//

#import "NSAttributedString+PHC.h"
#import<objc/runtime.h>

typedef NSMutableAttributedString *_Nullable (^PHCAddAttributeBlock)(NSAttributedStringKey attributeKey, id value);

@implementation NSString (PHCRange)

- (NSArray<NSString *> *)phc_allRangesOfSubString:(NSString*)subStr
{
    if (self.length < subStr.length) {
        return @[];
    }
    
    NSMutableArray *rangeArray = [NSMutableArray array];
    for(int i =0; i <= self.length - subStr.length; ++i) {
        NSRange range = NSMakeRange(i, subStr.length);
        NSString *temp = [self substringWithRange:range];
        if ([temp isEqualToString:subStr]) {
            NSRange range = {i,subStr.length};
            [rangeArray addObject:NSStringFromRange(range)];
        }
    }
    
    return rangeArray;
}

@end

@interface PHCAttributedProperty : NSObject

@property (nonatomic, assign) NSUInteger local;
@property (nonatomic, copy) NSString *operaString;

@end

@implementation PHCAttributedProperty

@end

@interface NSMutableAttributedString (YTCProperty)

@property (nonatomic, strong) PHCAttributedProperty *property;

@end

static const void *PHCPropertyKey = &PHCPropertyKey;
@implementation NSMutableAttributedString (YTCProperty)

- (PHCAttributedProperty *)property
{
    return objc_getAssociatedObject(self, PHCPropertyKey);
}

- (void)setProperty:(PHCAttributedProperty *)property
{
    objc_setAssociatedObject(self, PHCPropertyKey, property, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end


@implementation NSMutableAttributedString (PHC)

+ (PHCSingleStringBlock)attributedString
{
    return ^(NSString *string) {
        NSMutableAttributedString *result = [[NSMutableAttributedString alloc] initWithString:string];
        result.property = [[PHCAttributedProperty alloc] init];
        return result;
    };
}

- (PHCAddAttributeBlock)phc_addAttribute
{
    return ^(NSAttributedStringKey attributeKey, id value) {
        NSRange range = [self phc_operationRange];
        [self addAttribute:attributeKey value:value range:range];
        return self;
    };
}

- (PHCSingleStringBlock)phc_text
{
    return ^(NSString *string) {
        self.property.operaString = string.length == 0 ? self.string : string;
        return self;
    };
}

- (PHCSingleAttributeValueBlock)phc_local
{
    return ^(id value) {
        if (![value isKindOfClass:NSNumber.class]) {
            self.property.local = 0;
        }
        else {
            NSNumber *number = (NSNumber *)value;
            self.property.local = number.unsignedIntegerValue;
        }
        return self;
    };
}

- (NSRange)phc_operationRange
{
    if (!self.property.operaString) {
        return NSMakeRange(0, self.string.length);
    }
    
    NSArray *ranges = [self.string phc_allRangesOfSubString:self.property.operaString];
    NSInteger index = self.property.local >= ranges.count ? 0 : self.property.local;
    return NSRangeFromString(ranges[index]);
}

// Attributes
- (PHCSingleAttributeValueBlock)phc_addAttribute:(NSAttributedStringKey)key
{
    return ^(id value) {
        return self.phc_addAttribute(key, value);
    };
}

- (PHCSingleAttributeValueBlock)phc_font
{
    return [self phc_addAttribute:NSFontAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_underlineStyle
{
    return [self phc_addAttribute:NSUnderlineStyleAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_underlineColor
{
    return [self phc_addAttribute:NSUnderlineColorAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_textColor
{
    return [self phc_addAttribute:NSForegroundColorAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_textBackgroundColor
{
    return [self phc_addAttribute:NSBackgroundColorAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_strokeColor
{
    return [self phc_addAttribute:NSStrokeColorAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_strokeWidth
{
    return [self phc_addAttribute:NSStrokeWidthAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_paragraphStyle
{
    return [self phc_addAttribute:NSParagraphStyleAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_ligature
{
    return [self phc_addAttribute:NSLigatureAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_strikethroughStyle
{
    return [self phc_addAttribute:NSStrikethroughStyleAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_textEffect
{
    return [self phc_addAttribute:NSTextEffectAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_attachment
{
    return [self phc_addAttribute:NSAttachmentAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_link
{
    return [self phc_addAttribute:NSLinkAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_baselineOffset
{
    return [self phc_addAttribute:NSBaselineOffsetAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_strikethroughColor
{
    return [self phc_addAttribute:NSStrikethroughColorAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_writingDirection
{
    return [self phc_addAttribute:NSWritingDirectionAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_expansion
{
    return [self phc_addAttribute:NSExpansionAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_verticalGlyphForm
{
    return [self phc_addAttribute:NSVerticalGlyphFormAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_kern
{
    return [self phc_addAttribute:NSKernAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_obliqueness
{
    return [self phc_addAttribute:NSObliquenessAttributeName];
}

- (PHCSingleAttributeValueBlock)phc_shadow
{
    return [self phc_addAttribute:NSShadowAttributeName];
}

@end
