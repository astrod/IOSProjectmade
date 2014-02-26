//
//  NXFirstCell.m
//  HancomForIOS
//
//  Created by 채종운 on 2014. 2. 25..
//  Copyright (c) 2014년 채종운. All rights reserved.
//

#import "NXFirstCell.h"

@implementation NXFirstCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)onButtonInFirstCell:(id)sender {
    [self.firstCellTextView setHidden:![self.firstCellTextView isHidden]];
    
}
@end
