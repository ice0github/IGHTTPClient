//
//  ViewController.m
//  IGHTTPClient
//
//  Created by GavinHe on 16/4/19.
//  Copyright © 2016年 GavinHe. All rights reserved.
//

#import "ViewController.h"

#import "IGCellData.h"

#import "IGHTTPClient.h"
#import "IGBatchTaskManager.h"

#import "IGJSONModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tbMain;
    
    
    NSMutableArray *datas;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self buildUI];
    
    [self setupParser];
}

#pragma mark - ----> 界面

- (void)buildUI{
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect tbFrame = self.view.bounds;
    tbFrame.origin.y = VIEW_HEIGHT_NAV+VIEW_HEIGHT_STATUS;
    tbFrame.size.height -= tbFrame.origin.y;
    
    tbMain            = [[UITableView alloc] initWithFrame:tbFrame];
    tbMain.delegate   = self;
    tbMain.dataSource = self;
    [self.view addSubview:tbMain];
}

#pragma mark - ----> 数据

- (void)initData{
    datas = [[NSMutableArray alloc] init];
    
    [datas addObject:[IGCellData dataWithType:1000 andTitle:@"测试应用详情"]];
    [datas addObject:[IGCellData dataWithType:2000 andTitle:@"测试批量应用详情"]];
}

#pragma mark - ----> TableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datas.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

static NSString *cellID = @"Cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    IGCellData *data    = datas[indexPath.row];
    cell.textLabel.text = data.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    IGCellData *data    = datas[indexPath.row];

    NSString *funName = [NSString stringWithFormat:@"tests%d",data.type];
    SEL funSelector = NSSelectorFromString(funName);
    if ([self respondsToSelector:funSelector]) {
        [self performSelector:funSelector];
    }
}


#pragma mark - ----> 功能

- (void)setupParser{
    IGTestParser *testParser1 = [[IGTestParser alloc] init];
    [[IGJSONResponseObjectParserManager defaultManager] registParser:testParser1 forKey:pkIGTestParserApp];
    
    IGTestParser *testParser2 = [[IGTestParser alloc] init];
    testParser2.parserFlag = IGTestParserFlag_Version;
    [[IGJSONResponseObjectParserManager defaultManager] registParser:testParser2 forKey:pkIGTestParserVersion];
}

- (void)tests1000{
    
    RespDictionaryBlock db = ^(NSMutableDictionary *infoDict, NSError *error) {
        if (!error) {
            NSLog(@"complete success:\n%@",infoDict);
        }else{
            NSLog(@"complete failed:%@",error);
        }
    };
    
    [HTTPClient POSTApi:@"projectAction_queryProjectStatMove_t1.do"
             parameters:@{@"proId":@"2483582",
                          @"userId":@""}
              parserKey:pkIGTestParserApp
                success:[IGRespBlockGenerator taskSuccessBlockWithDictionaryBlock:db]
                failure:[IGRespBlockGenerator taskFailureBlockWithDictionaryBlock:db]];
}


- (void)tests2000{
    
    
    
    NSMutableArray *aa = [NSMutableArray new];
    
    for (int i = 0 ; i < 6 ;  i++) {
        RespDictionaryBlock db = ^(NSMutableDictionary *infoDict, NSError *error) {
            if (!error) {
                NSLog(@"complete success %d :\n%@",i,infoDict);
            }else{
                NSLog(@"complete failed %d :%@",i,error);
            }
        };
        NSURLSessionTask *task = [HTTPClient POSTApi:@"projectAction_queryProjectStatMove_t1.do"
                                          parameters:@{@"proId":@"2483582",
                                                       @"userId":@""}
                                         isAutoStart:NO
                                             success:[IGRespBlockGenerator taskSuccessBlockWithDictionaryBlock:db]
                                             failure:[IGRespBlockGenerator taskFailureBlockWithDictionaryBlock:db]];
        
        [aa addObject:task];
    }
    
    IGBatchTask *bt = [[IGBatchTask alloc] initWithTasks:aa progressBlock:^(NSInteger finish, NSInteger total) {
        NSLog(@"Batch Task Progress : %.2f  [%ld,%ld]",finish*1.0/total,finish,total);
    } complete:^(IGBatchTask *batchTask, NSArray *successTasks, NSArray *failureTasks) {
        NSLog(@"Batch Task complete :\nSuccess: %ld Failed:%ld",successTasks.count,failureTasks.count);
    }];
    [bt run];
}

#pragma mark - ----> 事件



@end
