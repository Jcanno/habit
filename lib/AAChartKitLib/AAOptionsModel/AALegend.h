//
//  AALegend.h
//  AAChartKit
//
//  Created by An An on 17/1/6.
//  Copyright ยฉ 2017ๅนด An An. All rights reserved.
//
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//***    https://github.com/AAChartModel/AAChartKit     ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************
//

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

#import <Foundation/Foundation.h>

@class AAItemStyle;

typedef NSString *AALegendLayoutType;
typedef NSString *AALegendAlignType;
typedef NSString *AALegendVerticalAlignType;

static AALegendLayoutType const AALegendLayoutTypeHorizontal = @"horizontal";
static AALegendLayoutType const AALegendLayoutTypeVertical   = @"vertical";

static AALegendAlignType const AALegendAlignTypeLeft   = @"left";
static AALegendAlignType const AALegendAlignTypeCenter = @"center";
static AALegendAlignType const AALegendAlignTypeRight  = @"right";

static AALegendVerticalAlignType const AALegendVerticalAlignTypeTop    = @"top";
static AALegendVerticalAlignType const AALegendVerticalAlignTypeMiddle = @"middle";
static AALegendVerticalAlignType const AALegendVerticalAlignTypeBottom = @"bottom";

@interface AALegend : NSObject

AAPropStatementAndFuncStatement(copy,   AALegend, AALegendLayoutType,        layout);//ๅพไพๆฐๆฎ้กน็ๅธๅฑใๅธๅฑ็ฑปๅ๏ผ "horizontal" ๆ "vertical" ๅณๆฐดๅนณๅธๅฑๅๅ็ดๅธๅฑ ้ป่ฎคๆฏ๏ผhorizontal.
AAPropStatementAndFuncStatement(copy,   AALegend, AALegendAlignType,         align);//่ฎพๅฎๅพไพๅจๅพ่กจๅบไธญ็ๆฐดๅนณๅฏน้ฝๆนๅผ๏ผๅๆณๅผๆleft๏ผcenter ๅ rightใ
AAPropStatementAndFuncStatement(copy,   AALegend, AALegendVerticalAlignType, verticalAlign);//่ฎพๅฎๅพไพๅจๅพ่กจๅบไธญ็ๅ็ดๅฏน้ฝๆนๅผ๏ผๅๆณๅผๆ top๏ผmiddle ๅ bottomใๅ็ดไฝ็ฝฎๅฏไปฅ้่ฟ y ้้กนๅ่ฟไธๆญฅ่ฎพๅฎใ
AAPropStatementAndFuncStatement(assign, AALegend, BOOL,          enabled);
AAPropStatementAndFuncStatement(strong, AALegend, NSNumber    *, borderWidth);
AAPropStatementAndFuncStatement(strong, AALegend, NSNumber    *, itemMarginTop);//ๅพไพ็ๆฏไธ้กน็้กถ้จๅค่พน่ท๏ผๅไฝpxใ ้ป่ฎคๆฏ๏ผ0.
AAPropStatementAndFuncStatement(strong, AALegend, AAItemStyle *, itemStyle);

@end
