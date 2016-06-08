//
//  ViewController.m
//  MyMovie
//
//  Created by HanJunqiang on 16/6/5.
//  Copyright © 2016年 HaRi. All rights reserved.
//

#import "ViewController.h"
//http://wow01.105.net/live/virgin1/playlist.m3u8
//http://ivi.bupt.edu.cn/hls/cctv1hd.m3u8 C1高清
//http://ivi.bupt.edu.cn/hls/cctv3hd.m3u8 C3高清
//http://ivi.bupt.edu.cn/hls/cctv5hd.m3u8 C5高清
//http://ivi.bupt.edu.cn/hls/cctv5phd.m3u8 C5+高清
//http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8 C6高清
//http://ivi.bupt.edu.cn/hls/cctv8hd.m3u8 C8高清
//http://ivi.bupt.edu.cn/hls/chchd.m3u8 CHC高清电影
//http://ivi.bupt.edu.cn/hls/btv6hd.m3u8 北京体育高清
//http://ivi.bupt.edu.cn/hls/hunanhd.m3u8 湖南高清
//http://ivi.bupt.edu.cn/hls/zjhd.m3u8 浙江高清
//http://ivi.bupt.edu.cn/hls/gdhd.m3u8 广东高清
//http://ivi.bupt.edu.cn/hls/tjhd.m3u8 天津高清

#define kMVAdress @"http://ivi.bupt.edu.cn/hls/btv6hd.m3u8"
#import "VMediaPlayer.h"
@interface ViewController ()<VMediaPlayerDelegate>

@property (nonatomic, strong)VMediaPlayer *vPlay;

@end

@implementation ViewController
-(void)dealloc
{
    [_vPlay unSetupPlayer];
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    _vPlay = [VMediaPlayer sharedInstance];
    [_vPlay setupPlayerWithCarrierView:self.view withDelegate:self];
    
    NSURL *vUrl = [NSURL URLWithString:kMVAdress];
    [_vPlay setDataSource:vUrl header:nil];
    [_vPlay prepareAsync];
    
}

// 当'播放器准备完成'时, 该协议方法被调用, 我们可以在此调用 [player start]
// 来开始音视频的播放.
- (void)mediaPlayer:(VMediaPlayer *)player didPrepared:(id)arg
{
    [player start];
}
// 当'该音视频播放完毕'时, 该协议方法被调用, 我们可以在此作一些播放器善后
// 操作, 如: 重置播放器, 准备播放下一个音视频等
- (void)mediaPlayer:(VMediaPlayer *)player playbackComplete:(id)arg
{
    [player reset];
}
// 如果播放由于某某原因发生了错误, 导致无法正常播放, 该协议方法被调用, 参
// 数 arg 包含了错误原因.
- (void)mediaPlayer:(VMediaPlayer *)player error:(id)arg
{
    NSLog(@"NAL 1RRE &&&& VMediaPlayer Error: %@", arg);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
