//
//  AAYAxis.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
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

#import <Foundation/Foundation.h>

@class AATitle,AALabels,AACrosshair;

typedef NSString *AAYAxisGridLineInterpolation;
static AAYAxisGridLineInterpolation const AAYAxisGridLineInterpolationCircle  = @"circle";//ๅๅฝข
static AAYAxisGridLineInterpolation const AAYAxisGridLineInterpolationPolygon = @"polygon";//ๅค่พนๅฝข

@interface AAYAxis : NSObject

//AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       min);
AAPropStatementAndFuncStatement(strong, AAYAxis, AATitle  *, title);
AAPropStatementAndFuncStatement(strong, AAYAxis, NSArray  *, plotLines);
AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       reversed);
AAPropStatementAndFuncStatement(strong, AAYAxis, NSNumber *, gridLineWidth);// y ่ฝด็ฝๆ ผ็บฟๅฎฝๅบฆ
AAPropStatementAndFuncStatement(copy,   AAYAxis, NSString *, gridLineColor);// y ่ฝด็ฝๆ ผ็บฟ้ข่ฒ
AAPropStatementAndFuncStatement(copy,   AAYAxis, NSString *, alternateGridColor);//backcolor of every other grid line area
AAPropStatementAndFuncStatement(copy,   AAYAxis, AAYAxisGridLineInterpolation, gridLineInterpolation);//Polar charts only. Whether the grid lines should draw as a polygon with straight lines between categories, or as circles. Can be either circle or polygon. ้ป่ฎคๆฏ๏ผnull.
AAPropStatementAndFuncStatement(strong, AAYAxis, AALabels *, labels);//็จไบ่ฎพ็ฝฎ y ่ฝดๆฏๅฆๆพ็คบ
AAPropStatementAndFuncStatement(strong, AAYAxis, NSNumber *, lineWidth);// y ่ฝด็บฟๅฎฝๅบฆ
AAPropStatementAndFuncStatement(copy,   AAYAxis, NSString *, lineColor);// y ่ฝด็บฟ้ข่ฒ

AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       allowDecimals); //y่ฝดๆฏๅฆๅ่ฎธๆพ็คบๅฐๆฐ
AAPropStatementAndFuncStatement(assign, AAYAxis, NSNumber *, max); //y่ฝดๆๅคงๅผ
AAPropStatementAndFuncStatement(assign, AAYAxis, NSNumber *, min); //y่ฝดๆๅฐๅผ๏ผ่ฎพ็ฝฎไธบ0ๅฐฑไธไผๆ่ดๆฐ๏ผ
AAPropStatementAndFuncStatement(strong, AAYAxis, NSArray  *, tickPositions);//่ชๅฎไนY่ฝดๅๆ ๏ผๅฆ๏ผ[@(0), @(25), @(50), @(75) , (100)]๏ผ
AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       visible); //y่ฝดๆฏๅฆๅ่ฎธๆพ็คบ
AAPropStatementAndFuncStatement(assign, AAYAxis, BOOL,       opposite);//ๆฏๅฆๅฐๅๆ ่ฝดๆพ็คบๅจๅฏน็ซ้ข๏ผ้ป่ฎคๆๅตไธ x ่ฝดๆฏๅจๅพ่กจ็ไธๆนๆพ็คบ๏ผy ่ฝดๆฏๅจๅทฆๆน๏ผๅๆ ่ฝดๆพ็คบๅจๅฏน็ซ้ขๅ๏ผx ่ฝดๆฏๅจไธๆนๆพ็คบ๏ผy ่ฝดๆฏๅจๅณๆนๆพ็คบ๏ผๅณๅๆ ่ฝดไผๆพ็คบๅจๅฏน็ซ้ข๏ผใ่ฏฅ้็ฝฎไธ่ฌๆฏ็จไบๅคๅๆ ่ฝดๅบๅๅฑ็คบ๏ผๅฆๅคๅจ Highstock ไธญ๏ผy ่ฝด้ป่ฎคๆฏๅจๅฏน็ซ้ขๆพ็คบ็ใ ้ป่ฎคๆฏ๏ผfalse.
AAPropStatementAndFuncStatement(strong, AAYAxis, NSNumber *, tickInterval);
AAPropStatementAndFuncStatement(strong, AAYAxis, AACrosshair*, crosshair); //ๅๆ็บฟๆ ทๅผ่ฎพ็ฝฎ


@end
