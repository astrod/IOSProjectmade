//
//  NXdataModel.h
//  HancomForIOS
//
//  Created by 채종운 on 2014. 2. 19..
//  Copyright (c) 2014년 채종운. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface NXdataModel : NSObject <NSURLConnectionDataDelegate>
-(NSDictionary*)objectAtIndex:(NSUInteger)index;
//-(NSDictionary*)returnAllData;
-(int)returnArrayLength;
-(void)downDataFromServer;

@property (weak, nonatomic) NSDictionary *_responseData;

@property UITableViewController* tableController;

@property ViewController* view; // viewContoller 와 매핑. 메소드동작시킴

@property int cellLength;


@end
