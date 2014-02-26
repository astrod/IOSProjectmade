//
//  ViewController.h
//  HancomForIOS
//
//  Created by 채종운 on 2014. 2. 19..
//  Copyright (c) 2014년 채종운. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem* rightButton;

-(void)chnageButtonStateToEnable;

@end
