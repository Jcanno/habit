//
//  AAStyle.m
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright ยฉ 2017ๅนด An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * ๐ ๐ ๐ ๐  โโโ   WARM TIPS!!!   โโโ ๐ ๐ ๐ ๐
 *
 * Please contact me on GitHub,if there are any problems encountered in use.
 * GitHub Issues : https://github.com/AAChartModel/AAChartKit/issues
 * -------------------------------------------------------------------------------
 * And if you want to contribute for this project, please contact me as well
 * GitHub        : https://github.com/AAChartModel
 * StackOverflow : https://stackoverflow.com/users/7842508/codeforu
 * JianShu       : http://www.jianshu.com/u/f1e6753d4254
 * SegmentFault  : https://segmentfault.com/u/huanghunbieguan
 *
 * -------------------------------------------------------------------------------
 
 */

#import "AAStyle.h"
//Styles for the label. ้ป่ฎคๆฏ๏ผ{"color": "contrast", "fontSize": "11px", "fontWeight": "bold", "textOutline": "1px 1px contrast" }.

@implementation AAStyle

//-(instancetype)init{
//    self = [super init];
//    if (self) {
//        self.color = @"#000000";
//        self.fontSize = @"11px";
//        self.fontWeight = @"bold";ๅฏ้็ๅผๆ bold ๅ thin ไธค็ง,ๅๅซๅฏนๅบ็ๆฏๅ ็ฒๅญไฝๅ็บค็ปๅญไฝ
//        self.textOutline = @"1px 1px contrast";
//    }
//    return self;
//}

AAPropSetFuncImplementation(AAStyle, NSString *, color);
AAPropSetFuncImplementation(AAStyle, NSString *, fontSize);
AAPropSetFuncImplementation(AAStyle, NSString *, fontWeight);
AAPropSetFuncImplementation(AAStyle, NSString *, textOutline);

@end
