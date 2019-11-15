//
//  NSAttributedString+PHC.m
//  PhotoCam
//
//  Created by Copper on 2019/10/22.
//  Copyright © 2019 PhotoCam. All rights reserved.
//

#import "NSAttributedString+PHC.h"
#import<objc/runtime.h>

static const void *PHCOperaStringKey = &PHCOperaStringKey;

typedef NSMutableAttributedString *_Nullable (^PHCAddAttributeBlock)(NSAttributedStringKey attributeKey, id value);

@interface NSMutableAttributedString (YTCProperty)

@property (nonatomic, copy) NSString *operaString;

@end

@implementation NSMutableAttributedString (YTCProperty)

- (NSString *)operaString
{
    return objc_getAssociatedObject(self, PHCOperaStringKey);
}

- (void)setOperaString:(NSString *)operaString
{
    objc_setAssociatedObject(self, PHCOperaStringKey, operaString, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end


@implementation NSMutableAttributedString (PHC)

+ (PHCSingleStringBlock)attributedString
{
    return ^(NSString *string) {
        return [[NSMutableAttributedString alloc] initWithString:string];
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
        self.operaString = string.length == 0 ? self.string : string;
        return self;
    };
}

- (NSRange)phc_operationRange
{
    if (!self.operaString) {
        return NSMakeRange(0, self.string.length);
    }

    return [self.string rangeOfString:self.operaString];
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
