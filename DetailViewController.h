//
//  DetailViewController.h
//  HancomForIOS
//
//  Created by 채종운 on 2014. 2. 20..
//  Copyright (c) 2014년 채종운. All rights reserved.
//

#import "ViewController.h"

@interface DetailViewController : UIViewController

@property (weak, nonatomic) NSDictionary *itemForHancom;


@property (weak, nonatomic) IBOutlet UITextView *mealText;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)onButtonImageView:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *showLunchorDinner;


@end
