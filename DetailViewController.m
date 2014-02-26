//
//  DetailViewController.m
//  HancomForIOS
//
//  Created by 채종운 on 2014. 2. 20..
//  Copyright (c) 2014년 채종운. All rights reserved.
//

#import "DetailViewController.h"
#import "NXdataModel.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>


@interface DetailViewController ()

@end

@implementation DetailViewController
{
    NXdataModel* _myModel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = [_itemForHancom objectForKey:@"date"];
    self.mealText.text = [_itemForHancom objectForKey:@"text"];
    self.mealText.textAlignment = NSTextAlignmentCenter;
    [self.imageView setImageWithURL:[_itemForHancom objectForKey:@"photoURL"]];
    self.mealText.backgroundColor = [UIColor lightTextColor];
    [self.mealText setFont:[UIFont fontWithName:@"Apple SD Gothic Neo" size:20]];
    [self.mealText setTextColor:[UIColor blackColor]];
    [self.mealText setHidden:YES];
    if([[_itemForHancom objectForKey:@"mealTime"] isEqualToString:@"석식메뉴"]) {
        [self.showLunchorDinner setEnabled:YES forSegmentAtIndex:1];
        [self.showLunchorDinner setSelectedSegmentIndex:1];
    }
    else {
        [self.showLunchorDinner setEnabled:YES forSegmentAtIndex:0];
        [self.showLunchorDinner setSelectedSegmentIndex:0];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onButtonImageView:(id)sender {
   [self.mealText setHidden:![self.mealText isHidden]];
    
}

- (void)setEnabled:(BOOL)enabled forSegmentAtIndex:(NSUInteger)segment {
    
}


@end
