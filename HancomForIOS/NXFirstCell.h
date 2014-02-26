//
//  NXFirstCell.h
//  HancomForIOS
//
//  Created by 채종운 on 2014. 2. 25..
//  Copyright (c) 2014년 채종운. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXFirstCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *firstCellImageView;
@property (weak, nonatomic) IBOutlet UITextView *firstCellTextView;
- (IBAction)onButtonInFirstCell:(id)sender;

@end
