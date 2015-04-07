//
//  ViewController.m
//  TouchKen
//
//  Created by Mac User on 2015/1/30.
//  Copyright (c) 2015年 Mac User. All rights reserved.
//

#import "ViewController.h"
#import "Ken.h"
@interface ViewController ()<KenDelegate>
{
    NSInteger nTag;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point=[[touches anyObject] locationInView:self.view ];
    Ken *ken=[[Ken alloc] initWithPoint:point atDirection:1];
    
    ken.delegate=self;
    ken.tag=nTag;
    nTag++;
    
    [self.view addSubview:ken];
}
- (IBAction)buttonGoLeftAction:(id)sender {
    Ken *lastKen=[self.view.subviews lastObject];
    //NSLog(lastKen);
    if (lastKen) {
        [lastKen GoLeft];
    }
}
- (IBAction)buttonGoRightAction:(id)sender {
    Ken *lastKen=[self.view.subviews lastObject];
    //NSLog(lastKen);
    if (lastKen) {
        [lastKen GoRight];
    }
}
- (void) Ken:(Ken *)ken didFinishedMoveWithStatus:(NSDictionary *)status {
    [];
    
}

@end
