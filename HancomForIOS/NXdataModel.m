//
//  NXdataModel.m
//  HancomForIOS
//
//  Created by 채종운 on 2014. 2. 19..
//  Copyright (c) 2014년 채종운. All rights reserved.
//

#import "NXdataModel.h"
#import "ViewController.h"

@implementation NXdataModel
{
    NSMutableData* _responseData;
    NSMutableArray* _itemArray; //MutableArray는 가변가능한 Array를 의미함. 프리미티브 type은 그냥 input을 할 수 없음.
    //dictionary는 key하고 object를 하나하나 짝지어서 input하는 것임. 딕셔너리는 순서가 없음. 그냥 key순서대로 찍힘. 순서를 꼭 보장할 방법이 없음!
    NSArray* sendDic;
    int cellLength;
}

-(id)init {
    self = [super init];
    if(self) {
        [self downDataFromServer];
    }
    return self;
}

-(void)downDataFromServer {
    _responseData = [[NSMutableData alloc]init];
    NSString *aURLString = @"http://heej.net/api/hancom_menu";
    NSURL *aURL = [NSURL URLWithString:aURLString];
    NSURLRequest *aRequest = [NSMutableURLRequest requestWithURL:aURL];
    NSURLConnection *connection = [[NSURLConnection alloc]
                                   initWithRequest:aRequest delegate:self startImmediately:YES];
}


-(NSDictionary*)objectAtIndex:(NSUInteger)index {
    return _itemArray[index];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"받기성공");
    [_responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError* error;
    _itemArray = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:&error];
    [_tableController.tableView reloadData];
    [_view chnageButtonStateToEnable];
    
}

-(int)returnArrayLength {
    return [_itemArray count];
}

//-(NSArray*)returnAllData {
// 
//    return sendDic;
//}

@end
