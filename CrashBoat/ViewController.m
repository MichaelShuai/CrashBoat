//
//  ViewController.m
//  CrashBoat
//
//  Created by Mrlee on 2018/3/6.
//  Copyright © 2018年 Mrlee. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app名称
    NSString *app_Name = [infoDictionary objectForKey:@"CFBundleDisplayName"];
    
    self.webView.scalesPageToFit = YES;
    self.webView.scrollView.bouncesZoom = NO;
    self.webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://previews.envatousercontent.com/files/236036861/index.html"]];
    [self.webView loadRequest:request];//加载网页
    
    [self startTime];
}
-(void)startTime
{
    //获取当前时间
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH-mm-sss"];
    //获取设备时间
     NSDate *startDate = [NSDate date];
    
    NSDate *endDate = [dateFormatter dateFromString:[self getyyyymmdd]];
    NSDate *endDate_tomorrow = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([endDate timeIntervalSinceReferenceDate])];

    NSTimeInterval timeInterval =[startDate timeIntervalSinceDate:endDate_tomorrow];
    
    //秒数
    NSInteger second =(NSInteger)timeInterval;
    //此处判断即可如果second大于10*24*3600就去执行方法
    if (second>=10*24*3600) {
        //可以推送！可以执行方法
        NSLog(@"推送吧大兄弟");
    }
    else
    {
      //10天倒计时还没到呢！！！
        NSLog(@"还没到火候！不要急!");
    }
  
}

-(NSString *)getyyyymmdd{
    NSDateFormatter *formatDay = [[NSDateFormatter alloc] init];
    formatDay.dateFormat = @"yyyy-MM-dd HH-mm-sss";
    NSDate *resDate = [formatDay dateFromString:@"2018-3-9 00-00-00"];
    NSString *dayStr = [formatDay stringFromDate:resDate];
    
    return dayStr;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
