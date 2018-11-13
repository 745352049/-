//
//  ViewController.m
//  选择音频
//
//  Created by 水晶岛 on 2018/11/9.
//  Copyright © 2018 水晶岛. All rights reserved.
//

#import "ViewController.h"

#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()<MPMediaPickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    /*
    albums 专辑
    artists 艺术家
    songs 歌曲
    playlists 播放列表
    podcasts 播客
    audiobooks 有声读物
    compilations 编译
    composers 作曲家
    genres 类型
    */
    /*
    MPMediaGrouping Title,
    MPMediaGrouping Album,
    MPMediaGrouping Artist,
    MPMediaGrouping AlbumArtist,
    MPMediaGrouping Composer,
    MPMediaGrouping Genre,
    MPMediaGrouping Playlist,
    MPMediaGrouping Pod cast Title
    
    MPMediaGrouping标题,
    MPMediaGrouping专辑,
    MPMediaGrouping艺术家,
    MPMediaGrouping专辑的艺术家,
    MPMediaGrouping作曲家,
    MPMediaGrouping流派,
    MPMediaGrouping播放列表,
    MPMediaGrouping 播客
    */
    
    MPMediaQuery *aa = [MPMediaQuery songsQuery];
    NSArray *aaa = aa.items;
    for (MPMediaItem *itmes in aaa) {
        NSLog(@"%@", itmes.title);
        NSLog(@"%@", itmes.assetURL.absoluteString);
    }
    
    NSLog(@"---------------");
    MPMediaQuery *allMp3 = [[MPMediaQuery alloc] init];
    MPMediaPropertyPredicate *albumNamePredicate = [MPMediaPropertyPredicate predicateWithValue:[NSNumber numberWithInt:MPMediaTypeMusic] forProperty: MPMediaItemPropertyMediaType];
    [allMp3 addFilterPredicate:albumNamePredicate];
    NSArray *bbb = allMp3.items;
    for (MPMediaItem *itmes in bbb) {
        NSLog(@"%@", itmes.title);
        NSLog(@"%@", itmes.assetURL.absoluteString);
    }
}
- (IBAction)selectMusicAction:(UIButton *)sender {
    MPMediaPickerController *picker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    picker.prompt = @"请选择您需要上传的歌曲";
    picker.showsCloudItems = NO;//是否显示下载项
    picker.allowsPickingMultipleItems = NO; //是否多选
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
}
#pragma mark MPMediaPickerControllerDelegate
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
    MPMediaItem *item = mediaItemCollection.items.firstObject;
    NSLog(@"%@---%@-----", item.title, item.assetURL.absoluteString);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
