//
//  DownloadTaskModel.m
//  DownloadTask
//
//  Created by yu_ookubo on 2018/06/29.
//  Copyright © 2018年 practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadTaskModel.h"

@interface DownloadTaskModel()

@end

@implementation DownloadTaskModel

- (void)DownloadBinaryWithUrlValue: (NSString *)urlValue
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer                  = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval   = 10;
    manager.requestSerializer.cachePolicy       = NSURLRequestReloadIgnoringLocalCacheData;
    
    [manager POST:urlValue
       parameters:nil
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         // responseをUTF-8に変換
         NSData *binaryData = [[NSData alloc] initWithData:responseObject];
         if (binaryData)
         {
             NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
             NSString  *documentsDirectory = [paths objectAtIndex:0];
             
             NSString  *localFilePath = [NSString stringWithFormat:@"%@/%@", documentsDirectory,@"tmpName.mp4"];
             
             dispatch_async(dispatch_get_main_queue(), ^{
                 [binaryData writeToFile:localFilePath atomically:YES];
                 
                 PHPhotoLibrary *library = [PHPhotoLibrary sharedPhotoLibrary];
                 [library performChanges:^{
                     [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL: [[NSURL alloc] initWithString:localFilePath]];
                 }
                       completionHandler:^(BOOL success, NSError * _Nullable error)
                  {
                      if (success)
                      {
                          dispatch_async(dispatch_get_main_queue(), ^{
                              //完了時
                          });
                      }
                  }];
             });
         }
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         
     }];
}

@end
