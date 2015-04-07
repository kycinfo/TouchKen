//
//  Ken.m
//  TouchKen
//
//  Created by Mac User on 2015/1/30.
//  Copyright (c) 2015年 Mac User. All rights reserved.
//

#import "Ken.h"

@implementation Ken

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(Ken *)initWithPoint:(CGPoint)point atDirection:(int) direction
{
    self = [super init];
    if (self) {
        UIImageView *kenImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ken1.png"]
                                   ];
        
        CGSize imageSize=kenImageView.frame.size;
        self.frame=CGRectMake(point.x=point.x-imageSize.width/2, point.y-imageSize.height*.8, imageSize.width, imageSize.height);
        
        NSArray *imgArrays = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"ken1.png"],
                              [UIImage imageNamed:@"ken2.png"],
                              [UIImage imageNamed:@"ken3.png"],
                              [UIImage imageNamed:@"ken4.png"],
                              [UIImage imageNamed:@"ken5.png"],
                              [UIImage imageNamed:@"ken6.png"],
                              nil];
        if (direction==1) {
            imgArrays = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"ken1r.png"],
                         [UIImage imageNamed:@"ken2r.png"],
                         [UIImage imageNamed:@"ken3r.png"],
                         [UIImage imageNamed:@"ken4r.png"],
                         [UIImage imageNamed:@"ken5r.png"],
                         [UIImage imageNamed:@"ken6r.png"],
                         nil];
            
        }
        
        kenImageView.animationImages=imgArrays;
        kenImageView.animationDuration=0.8;
        [kenImageView startAnimating];
        
        [self addSubview:kenImageView];
    }
    return self;
    
}
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self superview] bringSubviewToFront:self];
    CGPoint point = [[touches anyObject] locationInView:self];
    location=point;
}
-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point=[[touches anyObject] locationInView:self];
    CGRect newFrame = self.frame;
    newFrame.origin.x=newFrame.origin.x+point.x-location.x;
    newFrame.origin.y=newFrame.origin.y+point.y-location.y;
    
    [self setFrame:newFrame];
}

-(void)GoRight{
    [UIView transitionWithView:self duration:0.1 options:UIViewAnimationOptionTransitionNone animations:^{

        CGRect frame = self.frame;
        frame.origin.x+=50;
        self.frame=frame;
    } completion:^(BOOL finished) {
        //
        NSDictionary *status=@{@"status":@"Moving finished",
                               @"direction:":@"Right",
                               @"tag":[NSNumber numberWithInt:self.tag]};
        [self.delegate Ken:self didFinishedMoveWithStatus:status]; }];
     }
    
     
-(void)GoLeft{
    [UIView transitionWithView:self duration:0.1 options:UIViewAnimationOptionTransitionNone animations:^{

        CGRect frame = self.frame;
        frame.origin.x-=50;
        self.frame=frame;
    } completion:^(BOOL finished) {
        //
    }];
}

@end
