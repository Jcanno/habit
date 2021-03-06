//
//  AASeriesElement.h
//  AAChartKit
//
//  Created by An An on 17/1/5.
//  Copyright Â© 2017å¹´ An An. All rights reserved.
//*************** ...... SOURCE CODE ...... ***************
//***...................................................***
//*** https://github.com/AAChartModel/AAChartKit        ***
//*** https://github.com/AAChartModel/AAChartKit-Swift  ***
//***...................................................***
//*************** ...... SOURCE CODE ...... ***************

/*
 
 * -------------------------------------------------------------------------------
 *
 * ð ð ð ð  âââ   WARM TIPS!!!   âââ ð ð ð ð
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

@class AAMarker,AADataLabels;

@interface AASeriesElement : NSObject

AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, type);
AAPropStatementAndFuncStatement(assign, AASeriesElement, BOOL      , allowPointSelect);//æ¯å¦åè®¸å¨ç¹å»æ°æ®ç¹æ è®°ï¼markersï¼ãæ±å­ï¼æ±å½¢å¾ï¼ãæåºï¼é¥¼å¾ï¼æ¶éä¸­è¯¥ç¹ï¼éä¸­çç¹å¯ä»¥éè¿ Chart.getSelectedPoints æ¥è·åã é»è®¤æ¯ï¼false.
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, name);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSArray  *, data);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, color);
//AAPropStatementAndFuncStatement(assign, AASeriesElement, BOOL      , colorByPoint);//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. é»è®¤æ¯ï¼false.
AAPropStatementAndFuncStatement(strong, AASeriesElement, AAMarker *, marker);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, stacking);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, dashStyle);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, threshold);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, lineWidth);//æçº¿å¾ãæ²çº¿å¾ãç´æ¹æçº¿å¾ãæçº¿å¡«åå¾ãæ²çº¿å¡«åå¾ãç´æ¹æçº¿å¡«åå¾ççº¿æ¡å®½åº¦
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, borderWidth)//æ±å½¢å¾ãæ¡å½¢å¾ãæå½¢å¾ç­å¾å½¢çæè¾¹å®½åº¦
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, borderColor);//æ±å½¢å¾ãæ¡å½¢å¾ãæå½¢å¾é¡¿å·ç­å¾å½¢çæè¾¹é¢è²
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, fillColor);//æçº¿å¡«åå¾ãæ²çº¿å¡«åå¾ãç´æ¹æçº¿å¡«åå¾ç­å¡«åå¾ç±»åçå¡«åé¢è²
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, fillOpacity);//æçº¿å¡«åå¾ãæ²çº¿å¡«åå¾ãç´æ¹æçº¿å¡«åå¾ç­å¡«åå¾ç±»åçå¡«åé¢è²éæåº¦
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, negativeColor); // The color for the parts of the graph or points that are below the threshold
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, borderRadius);
AAPropStatementAndFuncStatement(copy,   AASeriesElement, NSString *, innerSize);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, size);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSArray  *, keys);
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSNumber *, yAxis);
AAPropStatementAndFuncStatement(strong, AASeriesElement, AADataLabels*, dataLabels);
AAPropStatementAndFuncStatement(strong, AASeriesElement, id        , step);//æ¯å¦è½¬åä¸ºç´æ¹æçº¿å¾
AAPropStatementAndFuncStatement(strong, AASeriesElement, NSDictionary *, states);

@end


