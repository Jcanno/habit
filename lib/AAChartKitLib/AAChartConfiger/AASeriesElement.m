//
//  AASeriesElement.m
//  AAChartKit
//
//  Created by An An on 17/1/19.
//  Copyright Â© 2017å¹´ An An. xAll rights reserved.
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


#import "AASeriesElement.h"

@implementation AASeriesElement

AAPropSetFuncImplementation(AASeriesElement, NSString *, type);
AAPropSetFuncImplementation(AASeriesElement, BOOL      , allowPointSelect);//æ¯å¦åè®¸å¨ç¹å»æ°æ®ç¹æ è®°ï¼markersï¼ãæ±å­ï¼æ±å½¢å¾ï¼ãæåºï¼é¥¼å¾ï¼æ¶éä¸­è¯¥ç¹ï¼éä¸­çç¹å¯ä»¥éè¿ Chart.getSelectedPoints æ¥è·åã é»è®¤æ¯ï¼false.
AAPropSetFuncImplementation(AASeriesElement, NSString *, name);
AAPropSetFuncImplementation(AASeriesElement, NSArray  *, data);
AAPropSetFuncImplementation(AASeriesElement, NSString *, color);
//AAPropSetFuncImplementation(AASeriesElement, BOOL      , colorByPoint);//When using automatic point colors pulled from the options.colors collection, this option determines whether the chart should receive one color per series or one color per point. é»è®¤æ¯ï¼false.
AAPropSetFuncImplementation(AASeriesElement, AAMarker *, marker);
AAPropSetFuncImplementation(AASeriesElement, NSString *, stacking);
AAPropSetFuncImplementation(AASeriesElement, NSString *, dashStyle);
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, threshold);
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, lineWidth);//æçº¿å¾ãæ²çº¿å¾ãç´æ¹æçº¿å¾ãæçº¿å¡«åå¾ãæ²çº¿å¡«åå¾ãç´æ¹æçº¿å¡«åå¾ççº¿æ¡å®½åº¦
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, borderWidth)//æ±å½¢å¾ãæ¡å½¢å¾ãæå½¢å¾ç­å¾å½¢çæè¾¹å®½åº¦
AAPropSetFuncImplementation(AASeriesElement, NSString *, borderColor);//æ±å½¢å¾ãæ¡å½¢å¾ãæå½¢å¾ç­å¾å½¢çæè¾¹é¢è²
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, fillColor);//æçº¿å¡«åå¾ãæ²çº¿å¡«åå¾ãç´æ¹æçº¿å¡«åå¾ç­å¡«åå¾ç±»åçå¡«åé¢è²
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, fillOpacity);//æçº¿å¡«åå¾ãæ²çº¿å¡«åå¾ãç´æ¹æçº¿å¡«åå¾ç­å¡«åå¾ç±»åçå¡«åé¢è²éæåº¦
AAPropSetFuncImplementation(AASeriesElement, NSString *, negativeColor); //The color for the parts of the graph or points that are below the threshold
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, borderRadius);
AAPropSetFuncImplementation(AASeriesElement, NSString *, innerSize);
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, size);
AAPropSetFuncImplementation(AASeriesElement, NSArray  *, keys);
AAPropSetFuncImplementation(AASeriesElement, NSNumber *, yAxis);
AAPropSetFuncImplementation(AASeriesElement, AADataLabels*, dataLabels);
AAPropSetFuncImplementation(AASeriesElement, id        , step);//æ¯å¦è½¬åä¸ºç´æ¹æçº¿å¾
AAPropSetFuncImplementation(AASeriesElement, NSDictionary *, states);


@end
