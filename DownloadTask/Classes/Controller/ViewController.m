//
//  ViewController.m
//  DownloadTask
//
//  Created by yu_ookubo on 2018/06/29.
//  Copyright © 2018年 practice. All rights reserved.
//

#import "ViewController.h"
#import "DownloadTaskModel.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self downloadBinary];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark Model

- (void)downloadBinary
{
    DownloadTaskModel *model = [DownloadTaskModel new];
    [model DownloadBinaryWithUrlValue:@"URL"];
}


@end
