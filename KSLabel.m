//
//  KSLabel.h
//
//  Created by Mustafa Gezen, 15.05.2014
//  Copyright (c) 2014 Mustafa Gezen. MIT licensed, do the what the fuck you want as long as you give credits
//
#import "KSLabel.h"

@implementation KSLabel
    - (id)initWithFrame:(CGRect)frame endDuration:(CGFloat)duration {
        UIFont *currentSystemFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:[UIFont systemFontSize]];
        self = [super initWithFrame:frame];

        if (self) {
            self.lineBreakMode = NSLineBreakByTruncatingMiddle;
            self.textAlignment = NSTextAlignmentCenter;
            self.numberOfLines = 1;
            self.font = currentSystemFont;
            self.textColor = [UIColor colorWithWhite:0.9 alpha:0.9];
            self.backgroundColor = [UIColor colorWithRed:52/255.0 green:53/255.0 blue:46/255.0 alpha:1.0];
            self.alpha = 0.6;
            self.layer.masksToBounds = YES;
            self.layer.cornerRadius = 10.0;
            self.tag = 0xFFFFFFFFF;
            self.userInteractionEnabled = NO;
        }

        _duration = duration;

        [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector:@selector(fadeOut:) userInfo: nil repeats:NO];

        return self;
    }

    - (void)fadeOut:(NSTimer *)timer {
        [UIView animateWithDuration:_duration animations:^(void) {
            self.alpha = fabs(0.0);
        }];
    }
@end
