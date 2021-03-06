//
//  AAChartModel.h
//  AAChartKit
//
//  Created by An An on 17/1/20.
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
#import <UIKit/UIKitDefines.h>
#import "AASeriesElement.h"
#import "AAPlotLinesElement.h"

typedef NS_ENUM(NSInteger,AAChartAnimation) {
    AAChartAnimationLinear = 0,
    AAChartAnimationEaseInQuad,
    AAChartAnimationEaseOutQuad,
    AAChartAnimationEaseInOutQuad,
    AAChartAnimationEaseInCubic,
    AAChartAnimationEaseOutCubic,
    AAChartAnimationEaseInOutCubic,
    AAChartAnimationEaseInQuart,
    AAChartAnimationEaseOutQuart,
    AAChartAnimationEaseInOutQuart,
    AAChartAnimationEaseInQuint,
    AAChartAnimationEaseOutQuint,
    AAChartAnimationEaseInOutQuint,
    AAChartAnimationEaseInSine,
    AAChartAnimationEaseOutSine,
    AAChartAnimationEaseInOutSine,
    AAChartAnimationEaseInExpo,
    AAChartAnimationEaseOutExpo,
    AAChartAnimationEaseInOutExpo,
    AAChartAnimationEaseInCirc,
    AAChartAnimationEaseOutCirc,
    AAChartAnimationEaseInOutCirc,
    AAChartAnimationEaseOutBounce,
    AAChartAnimationEaseInBack,
    AAChartAnimationEaseOutBack,
    AAChartAnimationEaseInOutBack,
    AAChartAnimationElastic,
    AAChartAnimationSwingFromTo,
    AAChartAnimationSwingFrom,
    AAChartAnimationSwingTo,
    AAChartAnimationBounce,
    AAChartAnimationBouncePast,
    AAChartAnimationEaseFromTo,
    AAChartAnimationEaseFrom,
    AAChartAnimationEaseTo,
};

typedef NSString *AAChartType;
typedef NSString *AAChartSubtitleAlignType;
typedef NSString *AAChartZoomType;
typedef NSString *AAChartStackingType;
typedef NSString *AAChartSymbolType;
typedef NSString *AAChartSymbolStyleType;
typedef NSString *AAChartFontWeightType;
typedef NSString *AALineDashSyleType;

UIKIT_EXTERN AAChartType const AAChartTypeColumn;
UIKIT_EXTERN AAChartType const AAChartTypeBar;
UIKIT_EXTERN AAChartType const AAChartTypeArea;
UIKIT_EXTERN AAChartType const AAChartTypeAreaspline;
UIKIT_EXTERN AAChartType const AAChartTypeLine;
UIKIT_EXTERN AAChartType const AAChartTypeSpline;
UIKIT_EXTERN AAChartType const AAChartTypeScatter;
UIKIT_EXTERN AAChartType const AAChartTypePie;
UIKIT_EXTERN AAChartType const AAChartTypeBubble;
UIKIT_EXTERN AAChartType const AAChartTypePyramid;
UIKIT_EXTERN AAChartType const AAChartTypeFunnel;
UIKIT_EXTERN AAChartType const AAChartTypeColumnrange;
UIKIT_EXTERN AAChartType const AAChartTypeArearange;
UIKIT_EXTERN AAChartType const AAChartTypeAreasplinerange;
UIKIT_EXTERN AAChartType const AAChartTypeBoxplot;
UIKIT_EXTERN AAChartType const AAChartTypeWaterfall;
UIKIT_EXTERN AAChartType const AAChartTypePolygon;

UIKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeLeft;
UIKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeCenter;
UIKIT_EXTERN AAChartSubtitleAlignType const AAChartSubtitleAlignTypeRight;

UIKIT_EXTERN AAChartZoomType const AAChartZoomTypeNone;
UIKIT_EXTERN AAChartZoomType const AAChartZoomTypeX;
UIKIT_EXTERN AAChartZoomType const AAChartZoomTypeY;
UIKIT_EXTERN AAChartZoomType const AAChartZoomTypeXY;

UIKIT_EXTERN AAChartStackingType const AAChartStackingTypeFalse;
UIKIT_EXTERN AAChartStackingType const AAChartStackingTypeNormal;
UIKIT_EXTERN AAChartStackingType const AAChartStackingTypePercent;

UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeCircle;
UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeSquare;
UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeDiamond;
UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeTriangle;
UIKIT_EXTERN AAChartSymbolType const AAChartSymbolTypeTriangle_down;

UIKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeDefault;
UIKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeInnerBlank;
UIKIT_EXTERN AAChartSymbolStyleType const AAChartSymbolStyleTypeBorderBlank;

UIKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeThin;
UIKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeRegular;
UIKIT_EXTERN AAChartFontWeightType const AAChartFontWeightTypeBold;

UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeSolid;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDash;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDashDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeShortDashDotDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDash;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDash;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeDashDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDashDot;
UIKIT_EXTERN AALineDashSyleType const AALineDashSyleTypeLongDashDotDot;

@interface AAChartModel : NSObject

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, title);//ๆ?้ขๅๅฎน
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, titleFontSize);//Title label font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, titleFontColor);//Title label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, titleFontWeight);//Title label font weight

AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitle);//ๅฏๆ?้ขๅๅฎน
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, subtitleFontSize);//Subtitle label font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitleFontColor);//Subtitle label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, subtitleFontWeight);//Subtitle label font weight

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, series);//ๅพ่กจ็ๆฐๆฎๅๅๅฎน
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray *,  keys);//Keys support

AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSubtitleAlignType, subtitleAlign);//ๅพ่กจๅฏๆ?้ขๆๆฌๆฐดๅนณๅฏน้ฝๆนๅผใๅฏ้็ๅผๆ โleftโ๏ผโcenterโๅโrightโใ ้ป่ฎคๆฏ๏ผcenter.
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartType,              chartType);//ๅพ่กจ็ฑปๅ
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartStackingType,      stacking);//ๅ?็งฏๆ?ทๅผ
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartSymbolType,        symbol);//ๆ็บฟๆฒ็บฟ่ฟๆฅ็น็็ฑปๅ๏ผ"circle", "square", "diamond", "triangle","triangle-down"๏ผ้ป่ฎคๆฏ"circle"
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartSymbolStyleType,   symbolStyle);
AAPropStatementAndFuncStatement(copy,   AAChartModel, AAChartZoomType,          zoomType);//็ผฉๆพ็ฑปๅ AAChartZoomTypeX ่กจ็คบๅฏๆฒฟ็ x ่ฝด่ฟ่กๆๅฟ็ผฉๆพ
AAPropStatementAndFuncStatement(assign, AAChartModel, AAChartAnimation,         animationType);//่ฎพ็ฝฎๅพ่กจ็ๆธฒๆๅจ็ป็ฑปๅ

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, animationDuration);//่ฎพ็ฝฎๅพ่กจ็ๆธฒๆๅจ็ปๆถ้ฟ(ๅจ็ปๅไฝไธบๆฏซ็ง)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       inverted);//x ่ฝดๆฏๅฆๅ็ด,้ป่ฎคไธบๅฆ
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisReversed);// x ่ฝด็ฟป่ฝฌ,้ป่ฎคไธบๅฆ
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisReversed);//y ่ฝด็ฟป่ฝฌ,้ป่ฎคไธบๅฆ
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       gradientColorEnabled);//ๆฏๅฆ่ฆไธบๆธๅ่ฒ,้ป่ฎคไธบๅฆ
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       polar);//ๆฏๅฆๆๅๅพๅฝข(ๅไธบ้ท่พพๅพ),้ป่ฎคไธบๅฆ
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       dataLabelEnabled);//ๆฏๅฆๆพ็คบๆฐๆฎ,้ป่ฎคไธบๅฆ
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontColor);//Datalabel font color
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, dataLabelFontSize);//Datalabel font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, dataLabelFontWeight);//Datalabel font weight
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSNumber *, dataLabelRotation);//Datalabel rotation in degrees 
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       dataLabelAllowOverlap);//Datalabel allow overlapping
//(Note: if rotation <> 0, 'dataLabelAllowOverlap' will not work - this is a bug in HighCharts (https://github.com/highcharts/highcharts/issues/7362)
//******

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisLabelsEnabled);//x ่ฝดๆฏๅฆๆพ็คบๆฐๆฎ
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSNumber *, xAxisLabelsFontSize);//xAxis font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, xAxisLabelsFontColor);//X-axis label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, xAxisLabelsFontWeight);//X-axis label font weight
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, categories);//x่ฝดๅๆ?ๆฏไธช็นๅฏนๅบ็ๅ็งฐ(ๆณจๆ:่ฟไธชไธๆฏ็จๆฅ่ฎพ็ฝฎ X ่ฝด็ๅผ,ไปไปๆฏ็จไบ่ฎพ็ฝฎ X ่ฝดๆๅญๅๅฎน็่ๅทฒ)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisGridLineWidth);//x ่ฝด็ฝๆ?ผ็บฟ็ๅฎฝๅบฆ
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisTickInterval);//x่ฝดๅปๅบฆ็น้ด้ๆฐ(่ฎพ็ฝฎๆฏ้ๅ?ไธช็นๆพ็คบไธไธช X่ฝด็ๅๅฎน)

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       xAxisVisible);//x ่ฝดๆฏๅฆๅฏ่ง(้ป่ฎคๅฏ่ง)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisVisible);//y ่ฝดๆฏๅฆๅฏ่ง(้ป่ฎคๅฏ่ง)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisLabelsEnabled);//y ่ฝดๆฏๅฆๆพ็คบๆฐๆฎ
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisTitle);//y ่ฝดๆ?้ข
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisLineWidth);//y y-axis line width
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisLabelsFontSize);//y y-axis labels font size
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisLabelsFontColor);//y-axis label font color
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisLabelsFontWeight);//y-axis label font weight
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisGridLineWidth);//y่ฝด็ฝๆ?ผ็บฟ็ๅฎฝๅบฆ
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisTickInterval);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray     <NSString *>*, colorsTheme);//ๅพ่กจไธป้ข้ข่ฒๆฐ็ป
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, backgroundColor);//ๅพ่กจ่ๆฏ่ฒ(ๅฟ้กปไธบๅๅญ่ฟๅถ็้ข่ฒ่ฒๅผๅฆ็บข่ฒ"#FF0000")

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       tooltipEnabled);//ๆฏๅฆๆพ็คบๆตฎๅจๆ็คบๆก(้ป่ฎคๆพ็คบ)
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, tooltipValueSuffix);//ๆตฎๅจๆ็คบๆกๅไฝๅ็ผ
//AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, tooltipValueString);//The tooltip string
//AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       tooltipCrosshairs);//ๆฏๅฆๆพ็คบๅๆ็บฟ(้ป่ฎคๆพ็คบ)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       connectNulls);//่ฎพ็ฝฎๆ็บฟๆฏๅฆๆญ็น้่ฟ(ๆฏๅฆ่ฟๆฅ็ฉบๅผ็น)
AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       legendEnabled);//ๆฏๅฆๆพ็คบๅพไพ lengend(ๅพ่กจๅบ้จๅฏ็นๆ็ๅ็นๅๆๅญ)

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       options3dEnabled);//ๆฏๅฆ 3D ๅๅพๅฝข(ไปๅฏนๆกๅฝขๅพ,ๆฑ็ถๅพๆๆ)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dAlpha);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dBeta);
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, options3dDepth);//3D ๅพๅฝขๆทฑๅบฆ

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, borderRadius);//ๆฑ็ถๅพ้ฟๆกๅพๅคด้จๅ่งๅๅพ(ๅฏ็จไบ่ฎพ็ฝฎๅคด้จ็ๅฝข็ถ,ไปๅฏนๆกๅฝขๅพ,ๆฑ็ถๅพๆๆ)
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, markerRadius);//ๆ็บฟ่ฟๆฅ็น็ๅๅพ้ฟๅบฆ

AAPropStatementAndFuncStatement(assign, AAChartModel, BOOL,       yAxisAllowDecimals);//ๆฏๅฆๅ่ฎธ y ่ฝดๆพ็คบๅฐๆฐ
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yAxisPlotLines);//y ่ฝดๅบ็บฟ็้็ฝฎ
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisMax);//y ่ฝดๆๅคงๅผ
AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisMin);//y ่ฝดๆๅฐๅผ๏ผ่ฎพ็ฝฎไธบ0ๅฐฑไธไผๆ่ดๆฐ๏ผ
AAPropStatementAndFuncStatement(strong, AAChartModel, NSArray  *, yAxisTickPositions);//่ชๅฎไน y ่ฝดๅๆ?๏ผๅฆ๏ผ[@(0), @(25), @(50), @(75) , (100)]๏ผ
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, zoomResetButtonText); //String to display in 'zoom reset button"

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, yAxisCrosshairWidth);
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, yAxisCrosshairColor);
AAPropStatementAndFuncStatement(assign, AAChartModel, AALineDashSyleType,   yAxisCrosshairDashStyleType);

AAPropStatementAndFuncStatement(strong, AAChartModel, NSNumber *, xAxisCrosshairWidth);
AAPropStatementAndFuncStatement(copy,   AAChartModel, NSString *, xAxisCrosshairColor);
AAPropStatementAndFuncStatement(assign, AAChartModel, AALineDashSyleType,   xAxisCrosshairDashStyleType);

//Additional options as a dictionary with JavaScript properties - note: if set, equal properties from the chartmodel will be overwritten!
AAPropStatementAndFuncStatement(strong, AAChartModel, NSDictionary  *, additionalOptions);

@end
