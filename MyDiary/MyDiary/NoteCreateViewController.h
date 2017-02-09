//
//  NoteCreateViewController.h
//  MyDiary
//
//  Created by tinoryj on 2017/2/8.
//  Copyright © 2017年 tinoryj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "NoteBL.h"
#import "Note.h"

@interface NoteCreateViewController : UIViewController

@property (nonatomic,strong)Note *currentPage;

@property (nonatomic,strong)NSString *date;

@property (nonatomic,strong)UIColor *themeColor;

//@property (nonatomic,weak)id<NotePageUpdateDelegate>  noteDelegate;

@end