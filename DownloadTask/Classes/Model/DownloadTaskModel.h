//
//  DownloadTaskModel.h
//  DownloadTask
//
//  Created by yu_ookubo on 2018/06/29.
//  Copyright © 2018年 practice. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <Photos/Photos.h>
#import <UIKit/UIKit.h>

@interface DownloadTaskModel : NSObject

- (void)DownloadBinaryWithUrlValue: (NSString *)urlValue;

@end
