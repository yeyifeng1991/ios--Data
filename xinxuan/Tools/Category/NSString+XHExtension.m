//
//  NSString+XHExtension.m
//  QiMu
//
//  Created by XH on 17/4/1.
//  Copyright © 2017年 XH. All rights reserved.
//

#import "NSString+XHExtension.h"
#import <CoreText/CoreText.h>

#define EmojiCodeToSymbol(c) ((((0x808080F0 | (c & 0x3F000) >> 4) | (c & 0xFC0) << 10) | (c & 0x1C0000) << 18) | (c & 0x3F) << 24)


@implementation NSString (XHExtension)

- (NSString *)emoji
{
    return [NSString emojiWithStringCode:self];
}

+ (NSString *)emojiWithStringCode:(NSString *)stringCode
{
    char *charCode = (char *)stringCode.UTF8String;
    long intCode = strtol(charCode, NULL, 16);
    return [self emojiWithIntCode:(int)intCode];
}

+ (NSString *)emojiWithIntCode:(int)intCode {
    int symbol = EmojiCodeToSymbol(intCode);
    NSString *string = [[NSString alloc] initWithBytes:&symbol length:sizeof(symbol) encoding:NSUTF8StringEncoding];
    if (string == nil) { // 新版Emoji
        string = [NSString stringWithFormat:@"%C", (unichar)intCode];
    }
    return string;
}

- (CGSize)sizeWithMaxWidth:(CGFloat)width andFont:(UIFont *)font
{
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    NSDictionary *dict = @{NSFontAttributeName : font};
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    /**
     
     NSAttributedString *attributS = [[NSAttributedString alloc] initWithString:self];
     CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attributS);
     CGSize targetSize = CGSizeMake(width, CGFLOAT_MAX);
     CGSize size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, (CFIndex)[attributS length]), NULL, targetSize, NULL);
     CFRelease(framesetter);
     return size;
     */
}

- (NSString *)originName
{
    NSArray *list = [self componentsSeparatedByString:@"_"];
    NSMutableString *orgName = [NSMutableString string];
    NSUInteger count = list.count;
    if (list.count > 1) {
        for (int i = 1; i < count; i ++) {
            [orgName appendString:list[i]];
            if (i < count-1) {
                [orgName appendString:@"_"];
            }
        }
    } else {  // 防越狱的情况下，本地改名字
        orgName = list[0];
    }
    return orgName;
}

+ (NSString *)currentName
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYYMMddHHMMss"];
    NSString *currentDate = [dateFormatter stringFromDate:[NSDate date]];
    return currentDate;
}

- (NSString *)firstStringSeparatedByString:(NSString *)separeted
{
    NSArray *list = [self componentsSeparatedByString:separeted];
    return [list firstObject];
}

@end