//
//  AAYAxis.m
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

#import "AAYAxis.h"

@implementation AAYAxis

//AAPropSetFuncImplementation(AAYAxis, BOOL,       min);
AAPropSetFuncImplementation(AAYAxis, AATitle  *, title);
AAPropSetFuncImplementation(AAYAxis, NSArray  *, plotLines);
AAPropSetFuncImplementation(AAYAxis, BOOL,       reversed);
AAPropSetFuncImplementation(AAYAxis, NSNumber *, gridLineWidth);
AAPropSetFuncImplementation(AAYAxis, NSString *, gridLineColor);
AAPropSetFuncImplementation(AAYAxis, NSString *, alternateGridColor);
AAPropSetFuncImplementation(AAYAxis, AAYAxisGridLineInterpolation, gridLineInterpolation);
AAPropSetFuncImplementation(AAYAxis, AALabels *, labels);
AAPropSetFuncImplementation(AAYAxis, NSNumber *, lineWidth);//y่ฝด็บฟๅฎฝๅบฆ
AAPropSetFuncImplementation(AAYAxis, NSString *, lineColor);// y ่ฝด็บฟ้ข่ฒ

AAPropSetFuncImplementation(AAYAxis, BOOL,       allowDecimals); //y่ฝดๆฏๅฆๅ่ฎธๆพ็คบๅฐๆฐ
AAPropSetFuncImplementation(AAYAxis, NSNumber *, max); //y่ฝดๆๅคงๅผ
AAPropSetFuncImplementation(AAYAxis, NSNumber *, min); //y่ฝดๆๅฐๅผ๏ผ่ฎพ็ฝฎไธบ0ๅฐฑไธไผๆ่ดๆฐ๏ผ
AAPropSetFuncImplementation(AAYAxis, NSArray  *, tickPositions);//่ชๅฎไนY่ฝดๅๆ?๏ผๅฆ๏ผ[@(0), @(25), @(50), @(75) , (100)]๏ผ
AAPropSetFuncImplementation(AAYAxis, BOOL,       visible); //y่ฝดๆฏๅฆๅ่ฎธๆพ็คบ
AAPropSetFuncImplementation(AAYAxis, BOOL,       opposite);//ๆฏๅฆๅฐๅๆ?่ฝดๆพ็คบๅจๅฏน็ซ้ข๏ผ้ป่ฎคๆๅตไธ x ่ฝดๆฏๅจๅพ่กจ็ไธๆนๆพ็คบ๏ผy ่ฝดๆฏๅจๅทฆๆน๏ผๅๆ?่ฝดๆพ็คบๅจๅฏน็ซ้ขๅ๏ผx ่ฝดๆฏๅจไธๆนๆพ็คบ๏ผy ่ฝดๆฏๅจๅณๆนๆพ็คบ๏ผๅณๅๆ?่ฝดไผๆพ็คบๅจๅฏน็ซ้ข๏ผใ่ฏฅ้็ฝฎไธ่ฌๆฏ็จไบๅคๅๆ?่ฝดๅบๅๅฑ็คบ๏ผๅฆๅคๅจ Highstock ไธญ๏ผy ่ฝด้ป่ฎคๆฏๅจๅฏน็ซ้ขๆพ็คบ็ใ ้ป่ฎคๆฏ๏ผfalse.
AAPropSetFuncImplementation(AAYAxis, NSNumber *, tickInterval);
AAPropSetFuncImplementation(AAYAxis, AACrosshair*, crosshair); //ๅๆ็บฟๆ?ทๅผ่ฎพ็ฝฎ


@end
