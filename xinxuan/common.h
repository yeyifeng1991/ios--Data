//
//  common.h
//  QiMu
//
//  Created by XH on 16/11/17.
//  Copyright © 2016年 XH. All rights reserved.
//

#ifndef common_h
#define common_h

/** APP版本号 */
#define XHAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** APP BUILD 版本号 */
#define XHAppBuildVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
/** App  项目名称 */
#define XHBundleName     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"]
/** APP名字 */
#define XHAppDisplayName [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"]
/** 当前语言 */
#define XHLocalLanguage [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode]
/** 当前国家 */
#define XHLocalCountry [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode]
/*沙盒路径*/
#define DOCPATH          NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0]
//获取屏幕 宽度、高度
#define imgWidth ([UIScreen mainScreen].bounds.size.width-30-20)/3 //高宽相等
#define SCREEN_BOUNDS ([UIScreen mainScreen].bounds)
#define SCREEN_WIDTH (SCREEN_BOUNDS.size.width)
#define SCREEN_HEIGHT (SCREEN_BOUNDS.size.height)
#define SCALE (SCREEN_WIDTH/375)
//通知
#define XHNotificationCenter [NSNotificationCenter defaultCenter]
//plist
#define XHDefault [NSUserDefaults standardUserDefaults]

#pragma - mark - 颜色

#define XHRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define XHColor(colorValue) [UIColor colorWithRed:((float)((colorValue & 0xFF0000) >> 16)) / 255.0 green:((float)((colorValue & 0xFF00) >> 8)) / 255.0 blue:((float)(colorValue & 0xFF)) / 255.0 alpha:1.0]

#define button_red XHColor(0xf41515)
#pragma - mark -  字体格式
#define XHFont(ff) [UIFont fontWithName:@"STHeitiSC-Light" size:ff]
#pragma - mark - 间距

#define CELL_HEIGHT 44
#define orderRecord 75*SCALE // 订单记录的单元格高度

#define ACCOUNT    @"accunt" // 用来处理账号异常的判断
#define AccountError @"您的账户异常" //账户异常提醒的字符
#define CHANNELID @"channelId" //手机channelId
#define ordercode @"orderCode" //订单号的code


#pragma - mark - navigation高度，tabbar高度

#define  NAVIGATION_HEIGHT 64
#define  TABBAR_HEIGHT 44
#define  SEPARATOR 0.5  //单元格底部的分割线高度
#define  SIZE     @"20"  // 页面记录
#define  SQUARE(x)((x) * (x)) //拿到倍数

#define  HEIGHT_CHATBOX       49      // 就是chatBox的高度
#define  CHATBOX_BUTTON_WIDTH        37
#define  HEIGHT_TEXTVIEW             HEIGHT_CHATBOX * 0.74
#define  MAX_TEXTVIEW_HEIGHT         104

#define  BOXBTNSPACE 4
#define  BOXOTHERH 215
#define  BOXTOTALH   (HEIGHT_TABBAR+BOXOTHERH)
#define  BOXBTNBOTTOMSPACE    6
#define  BOXTEXTViewSPACE 6.5
#define  videwViewH SCREEN_HEIGHT * 0.64 // 录制视频视图高度
#define  videwViewX SCREEN_HEIGHT * 0.36 // 录制视频视图X


#pragma - mark - 标示

#define PAYCODE @1001 //用户角色

#pragma - mark - 通知

#define GuideViewFinish @"guideViewFinish" //引导图
#define ADImageLoadSecussed @"adImageLoadSecussed" //广告图加载成功
#define ADImageLoadFail @"adImageLoadFail"//广告图加载失败
#define LogoutAndCleanPassword @"LogoutAndCleanPassword"//登陆超时，清除用户信息
#define LoginViewAppear @"loginViewAppear"//跳转登陆页
#define LoginViewDisAppear @"LoginViewDisAppear" //登陆成功销毁登陆页

#define MESSAGE @"messageNotification"//聊天消息通知
#define ListMessage @"listMessageNotification" //会话列表消息通知

#pragma - mark - 标示 搜索历史

#define PlanSearchViewControllerHistorySearchArray @"PlanSearchViewControllerHistorySearchArray"
#define MaterialSearchViewControllerHistorySearchArray @"MaterialSearchViewControllerHistorySearchArray"
#define ProductionSearchViewControllerHistorySearchArray @"ProductionSearchViewControllerHistorySearchArray"
#define HomeSearchViewControllerHistorySearchArray @"HomeSearchViewControllerHistorySearchArray"

#pragma - mark - 首页记录筛选选项

#define newProductionFilterAttribute @"newProductionFilterAttribute"//最后一次选中鞋样的分类
#define oldProductionFilterAttribute @"oldProductionFilterAttribute"//上一次选择鞋样的分类
#define newMaterialFilterAttribute @"newMaterialFilterAttribute"
#define oldMaterialFilterAttribute @"oldMaterialFilterAttribute"

#pragma - mark - 筛选界面记录筛选属性id

#define id_productionFilter @"id_productionFilter"
#define id_materialFilter @"id_materialFilter"
#define id_factoryFilter @"id_factoryFilter"

#pragma - mark - 筛选界面记录筛选属性的名称

#define name_productionFilter      @"name_productionFilter"//属性名称
#define sction_productionFilter     @"sction_productionFilter"//分类名称
#define all_name_production         @"all_name_production"//属性及分类拼接name，为了在首页展示
#define name_materialFilter          @"name_materialFilter"//
#define sction_materialFilter         @"sction_materialFilter"//
#define all_name_materialFilter      @"all_name_materialFilter"

#pragma - mark - 筛选界面记录城市id

#define cityNameMaterialFilter @"cityNameMaterialFilter"
#define city_materialFilter        @"city_materialFilter"
#define province_materialFilter @"province_materialFilter"

#define cityNameFactoryFilter @"cityNameFactoryFilter"
#define city_factoryFilter        @"city_factoryFilter"
#define province_factoryFilter @"province_factoryFilter"

#endif /* common_h */
