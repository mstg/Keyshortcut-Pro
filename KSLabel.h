//
//  KSLabel.h
//
//  Created by Mustafa Gezen, 15.05.2014
//  Copyright (c) 2014 Mustafa Gezen. MIT licensed, do the what the fuck you want as long as you give credits
//
#import <UIKit/UIKit.h>

@interface KSLabel : UILabel
{
    CGFloat _duration;
}
    - (id)initWithFrame:(CGRect)frame endDuration:(CGFloat)duration;
@end
