//
//  ViewController.m
//  MyDiary
//
//  Created by tinoryj on 2017/1/31.
//  Copyright © 2017年 tinoryj. All rights reserved.
//

#import "RootViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.noteBl = [[NoteBL alloc] init];
    Note *note = [[Note alloc] init];
    note.date = [[NSDate alloc] init];
    note.title = @"1234";
    note.content = @"Test for storage";
    note.location = @"测试地点：山西省太原市";
    [self.noteBl createNote: note];
    
    
    self.diaryBl = [[DiaryBL alloc]init];
    Diary *diary = [[Diary alloc]init];
    diary.date = [[NSDate alloc]init];
    diary.title = @"TEST";
    diary.content = @"qwertyuioppasfsdgfjklcvxnbcvxzbdszvdsgvdf fghnfgnrgs rndrst rtf";
    diary.location = @"测试地点：山西省太原市";
    [self.diaryBl createDiary:diary];
    
    [self themeSetting];
    [self viewControllersInit];
    [self titleLableInit];
    [self buildSegmentControl];
    [self buildToolBar];
    
    
}
//主题设置
- (void)themeSetting {
    //主题颜色
    UIColor *blueThemeColor = [UIColor colorWithRed:107/255.0 green:183/255.0 blue:219/255.0 alpha:1];
    //UIColor *redThemeColor = [UIColor colorWithRed:246/255.0 green:120/255.0 blue:138/255.0 alpha:1];
    _themeColor = blueThemeColor;
    //控件大小设置
    _deviceScreenSize = [UIScreen mainScreen].bounds.size;
    _buttonRect = CGRectMake(0, 0, 20, 20);
    
    //属性设置
    self.navigationController.navigationBar.hidden=YES;
    self.navigationController.toolbar.hidden=NO;
    //self.navigationController.toolbar.translucent=NO;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)titleLableInit {
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake( _deviceScreenSize.width / 2 - 100, 66, 200, 20)];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setTextColor:_themeColor];
    [_titleLabel setFont:[UIFont fontWithName:@"AppleGothic" size:20]];
    [self.view addSubview:_titleLabel];
    
}

- (void)viewControllersInit {
    
    _elementVC = [[ElementViewController alloc]init];
    [_elementVC.view setFrame:CGRectMake(0, 90, _deviceScreenSize.width, _deviceScreenSize.height-140)];
    [self addChildViewController:_elementVC];
    _diaryVC = [[DiaryViewController alloc]init];
    [_diaryVC.view setFrame:CGRectMake(0, 90, _deviceScreenSize.width, _deviceScreenSize.height-140)];
    [self addChildViewController:_diaryVC];
    _calendarVC = [[CalendarViewController alloc]init];
    [_calendarVC.view setFrame:CGRectMake(0, 90, _deviceScreenSize.width, _deviceScreenSize.height-140)];
    [self addChildViewController:_calendarVC];
    _noteCreateVC = [[NoteCreateViewController alloc]init];
    [_noteCreateVC.view setFrame:CGRectMake(0, 90, _deviceScreenSize.width, _deviceScreenSize.height-140)];
    [self addChildViewController:_noteCreateVC];
    _diaryCreateVC = [[DiaryCreateViewController alloc]init];
    [_diaryCreateVC.view setFrame:CGRectMake(0, 90, _deviceScreenSize.width, _deviceScreenSize.height-140)];
    [self addChildViewController:_diaryCreateVC];
    
    [self.view addSubview:self.diaryVC.view];
    [self.view addSubview:self.calendarVC.view];
    [self.view addSubview:self.elementVC.view];
    [self.view addSubview:self.noteCreateVC.view];
    [self.view addSubview:self.diaryCreateVC.view];
}

- (void)buildSegmentControl {
    
    UISegmentedControl *baseSegmentControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(40, 30, _deviceScreenSize.width - 80, 30)];

    [baseSegmentControl setTintColor:_themeColor];
    [baseSegmentControl setMultipleTouchEnabled:YES];

    [baseSegmentControl insertSegmentWithTitle:@"项目" atIndex:0 animated:YES];
    [baseSegmentControl insertSegmentWithTitle:@"日历" atIndex:1 animated:YES];
    [baseSegmentControl insertSegmentWithTitle:@"日记" atIndex:2 animated:YES];
    
    [baseSegmentControl setSelectedSegmentIndex:0];
    [_titleLabel setText:@"ELEMENTS"];
    [self.view bringSubviewToFront:_elementVC.view];
    [baseSegmentControl addTarget:self action:@selector(selectView:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:baseSegmentControl];
}

//切换视图
- (void)selectView:(UISegmentedControl*)baseSegmentControl
{
    if(baseSegmentControl.selectedSegmentIndex == 0){
        
        [_titleLabel setText:@"ELEMENTS"];
        [self.view bringSubviewToFront:_elementVC.view];
    }
    if (baseSegmentControl.selectedSegmentIndex == 1){

        [_titleLabel setText:@"CALENDER"];
        [self.view bringSubviewToFront:_calendarVC.view];
    }
    if (baseSegmentControl.selectedSegmentIndex == 2){
        
        [_titleLabel setText:@"DIARY"];
        [self.view bringSubviewToFront:_diaryVC.view];
    }
    
}

- (void)buildToolBar {


    UIToolbar *baseToolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 50, [UIScreen mainScreen].bounds.size.width, 50)];
    [baseToolbar setBarTintColor:_themeColor];
    
    //自定义按钮
    UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [listButton setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    [listButton setFrame:_buttonRect];
    UIButton *charactersButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [charactersButton setImage:[UIImage imageNamed:@"characters"] forState:UIControlStateNormal];
    [charactersButton setFrame:_buttonRect];
    UIButton *cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraButton setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
    [cameraButton setFrame:_buttonRect];
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [itemButton setImage:[UIImage imageNamed:@"item"] forState:UIControlStateNormal];
    [itemButton setFrame:_buttonRect];

    [charactersButton addTarget:self.elementVC action:@selector(charactersButtonAction) forControlEvents:UIControlEventTouchUpInside];

    //添加按钮到toolBar
    UIBarButtonItem *listBarButton = [[UIBarButtonItem alloc]initWithCustomView:listButton];
    UIBarButtonItem *itemBarButton = [[UIBarButtonItem alloc]initWithCustomView:itemButton];
    UIBarButtonItem *cameraBarButton = [[UIBarButtonItem alloc]initWithCustomView:cameraButton];
    UIBarButtonItem *charactersBarButton = [[UIBarButtonItem alloc]initWithCustomView:charactersButton];
    //间距修正
    UIBarButtonItem *blankBarButton1=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    [blankBarButton1 setWidth:10];
    UIBarButtonItem *blankBarButton2=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    if(_deviceScreenSize.width == 375)
        [blankBarButton2 setWidth:136 - (_buttonRect.size.width -23)*3];
    else if(_deviceScreenSize.width == 320)
        [blankBarButton2 setWidth:91 - (_buttonRect.size.width -23)*3];
    else if(_deviceScreenSize.width == 414)
        [blankBarButton2 setWidth:185 - (_buttonRect.size.width -23)*3];
    else if(_deviceScreenSize.width == 768)
        [blankBarButton2 setWidth:539 - (_buttonRect.size.width -23)*3];
    else if(_deviceScreenSize.width == 1024)
        [blankBarButton2 setWidth:795 - (_buttonRect.size.width -23)*3];
    
    NSArray *baseToolBarItem=[NSArray arrayWithObjects:listBarButton,blankBarButton1,charactersBarButton,blankBarButton1,cameraBarButton,blankBarButton2,itemBarButton,nil];
    [baseToolbar setItems:baseToolBarItem];
    [self.view addSubview:baseToolbar];
    
    

    
    //项目数显示lable
    _itemShowLabel = [[UILabel alloc]initWithFrame:CGRectMake(_deviceScreenSize.width - 70,_deviceScreenSize.height - 24 - (_buttonRect.size.height / 2), 70, _buttonRect.size.height)];
    [_itemShowLabel setTextColor:[UIColor whiteColor]];
    [_itemShowLabel setFont:[UIFont fontWithName:@"Apple LiGothic Medium" size:_buttonRect.size.height-3]];
    [self.view addSubview:_itemShowLabel];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(catchItemNumber) userInfo:nil repeats:YES];
}

-(void)catchItemNumber{

    self.NoteListData = [self.noteBl findAll];
    itemNumber = [_NoteListData count];
    
    NSString *itemNumberShow=[NSString stringWithFormat:@"%ld 项目",itemNumber];
    [_itemShowLabel setText:itemNumberShow];
}

@end
