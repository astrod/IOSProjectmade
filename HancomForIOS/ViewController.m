//
//  ViewController.m
//  HancomForIOS
//
//  Created by 채종운 on 2014. 2. 19..
//  Copyright (c) 2014년 채종운. All rights reserved.
//

#import "ViewController.h"
#import "NXMyCell.h"
#import "NXdataModel.h"
#import "DetailViewController.h"
#import "NXFirstCell.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NXdataModel* _myModel;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _myModel = [[NXdataModel alloc]init];
    _myModel.tableController = (UITableViewController*)self;
    _myModel.view = (ViewController*)self;
    _rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refresh:)]; // 오른쪽에 refresh 버튼을 만들어주는 것. 버튼을 눌렀을 시 selector 로 refresh 함수를 동작하게 함.
    self.navigationItem.rightBarButtonItem = _rightButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -DataSource

//numberofsectionintable : 구현 안하면 1; 섹션을 정하는 것임.
//tableView:numberofrowinsection : 너 row를 몇개로 할거니?
//tableview에게 3을 주고 나면 cellForRowAtIndexPath를 가지고 ...row를 어떻게 그리면 되니?
//여기에 테이블에 item을 넘겨주면 그려지게 됨.


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_myModel returnArrayLength]-1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 350;
    } else {
        return 60;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary* dateItem = [_myModel objectAtIndex:0];
    NSString* date = [dateItem objectForKey:@"date"];
    NSString* mealTime = [dateItem objectForKey:@"mealTime"];
    NSString* totalString = [[date stringByAppendingString:@" "] stringByAppendingString:mealTime];
    return totalString;
}	


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell을 만든다. Array에서 만든 딕셔너리에서 하나씩 꺼내서 셀에 뿌려줄거다.
    if(indexPath.row == 0) {
        NSDictionary* firstItem = [_myModel objectAtIndex:0];
        NXFirstCell* firstCell = [tableView dequeueReusableCellWithIdentifier:@"FirstCell"];
        [firstCell.firstCellImageView setImageWithURL: [firstItem objectForKey:@"photoURL"]];
        firstCell.firstCellTextView.text = [firstItem objectForKey:@"text"];
        firstCell.firstCellTextView.backgroundColor = [UIColor lightTextColor];
        [firstCell.firstCellTextView setFont:[UIFont fontWithName:@"Apple SD Gothic Neo" size:20]];
        [firstCell.firstCellTextView setTextColor:[UIColor blackColor]];
        [firstCell.firstCellTextView setHidden:YES];
        
        return firstCell;
    }
    else {
    
        NSDictionary* item = [_myModel objectAtIndex:indexPath.row];
        NXMyCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellForHancom"];
        NSString* date = [item objectForKey:@"date"];
        NSString* mealTime = [item objectForKey:@"mealTime"];
        NSString* totalString = [[date stringByAppendingString:@" "] stringByAppendingString:mealTime];
        cell.dateLabel.text = totalString;
        
        return cell;
    
    }
    
}




-(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"HancomDetailSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *nextController = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    nextController.itemForHancom = [_myModel objectAtIndex:indexPath.row];
}

-(void)refresh:(id)sender { //화면의 데이터를 refresh함.
    NSLog(@"버튼누름");
    [_myModel downDataFromServer];
    _rightButton.enabled = NO;
}

-(void)chnageButtonStateToEnable {
    _rightButton.enabled = YES;
}





@end
