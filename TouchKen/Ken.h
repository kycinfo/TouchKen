//
//  Ken.h
//  TouchKen
//
//  Created by Mac User on 2015/1/30.
//  Copyright (c) 2015年 Mac User. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Ken; //預告有個類別叫做 Ken
@protocol KenDelegate <NSObject>
//底下一直到@end前都是這個 protocol 的宣告
@optional   //optional 底下的表示可實作或不實作
- (void)Ken:(Ken *)ken didFinishedMoveWithStatus:(NSDictionary *) status;

@end



@interface Ken : UIView
//下面這些屬性方法是為了公開所以宣告在這裏

{
    CGPoint location;
}
@property (strong,nonatomic) id<KenDelegate> delegate;
-(Ken *)initWithPoint:(CGPoint)point atDirection:(int) direction;
-(void)GoRight;
-(void)GoLeft;

@end
