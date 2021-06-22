//
//  AppDelegate.m
//  DummyCode
//
//  Created by 4399 on 2017/12/22.
//  Copyright © 2017年 4399. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property (nonatomic, strong)NSMutableArray *dataArray; //源数组
@property (nonatomic, strong)NSMutableArray *tempArray;//过度数组
@property (nonatomic, strong)NSMutableArray *resultArray;//结果数组s

@end

@implementation AppDelegate

- (long)getBetCountWithGamesCount:(int)count itemCountForEachGame:(NSArray *)array passWay:(int)passway
{
    long result = 0;
    if (passway < 2 || passway > count || count < 2) {
        return 0;
    }
    NSMutableArray *matrixArray = [NSMutableArray array];
    for (int i = 0; i < passway; i ++) {
        [matrixArray addObject:@(1)];
    }
    NSLog(@"第一次循环结果:%@",matrixArray);
    for (int i = passway; i < count; i ++) {
        [matrixArray addObject:@(0)];
    }
    NSLog(@"第二次循环结果:%@",matrixArray);
    result += [self getItemBetCountWithArray:matrixArray itemCountForEachGame:array];
    
    while (1) {

        if ([self shouldBreakFromCirculationWithArray:matrixArray passway:passway]) {
            break;
        }else{
            int i = 0;
            for (i = 0; i < matrixArray.count - 1; i ++) {
                if ([matrixArray[i] intValue] == 1 && [matrixArray[i + 1] intValue] == 0) {
                    [matrixArray exchangeObjectAtIndex:i withObjectAtIndex:(i + 1)];
                    break;
                }
            }
            for (int j = 0 ; j < i - 1; j ++) {
                for (int k = 0; k < i - 1 - j; k ++) {
                    if ([matrixArray[k] intValue] < [matrixArray[k + 1] intValue]) {
                        [matrixArray exchangeObjectAtIndex:k withObjectAtIndex:(k + 1)];
                    }
                }
            }
            result += [self getItemBetCountWithArray:matrixArray itemCountForEachGame:array];
        }
    }
    return result;
}

- (long)getItemBetCountWithArray:(NSMutableArray *)matrixArray itemCountForEachGame:(NSArray *)array{
NSLog(@"huzhixinmatrixArray=%@",matrixArray);
    NSLog(@"huzhixin%@",array);
    long count = 1;
    for (int i = 0; i < [matrixArray count]; i ++) {
        if ([matrixArray[i] intValue] == 1) {
            count *= [array[i] intValue];
        }
    }
    return count;
}

- (BOOL)shouldBreakFromCirculationWithArray:(NSMutableArray *)matrixArray passway:(int)passway
{
    BOOL shouldBreak = YES;
    for (int i = 0; i < matrixArray.count - passway; i ++) {
        if ([matrixArray[i] intValue] == 1) {
            shouldBreak = NO;
            break;
        }
    }
    return shouldBreak;
}
- (void)newCaculateSort{
    [self combination:9 in:4];
}

- (void)combination:(int)n in:(int)m{
    if (m == 0) {
        [_resultArray addObject:[NSArray arrayWithArray:_tempArray]];
        return;
    }
    for (int i = n; i >= m ; --i) {
        [_tempArray replaceObjectAtIndex:m-1 withObject:[_dataArray objectAtIndex:i-1]];
        [self combination:i-1 in:m-1];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
//    _dataArray = [[NSMutableArray alloc]init];
//    [_dataArray setArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"]];
//    _resultArray = [[NSMutableArray alloc]init];
//    _tempArray = [[NSMutableArray alloc]initWithCapacity:4];
//    [_tempArray setArray:@[@"0",@"0",@"0",@"0"]];
//    [self newCaculateSort];
////    NSLog(@"%@",_resultArray);
//  long a =   [self getBetCountWithGamesCount:4 itemCountForEachGame:@[@(2),@(1),@(1),@(1)] passWay:2];
//    NSLog(@"%ld-----",a);
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
