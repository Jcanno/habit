//
//  AAOptions.m
//  AAChartKit
//
//  Created by An An on 17/1/4.
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

#import "AAOptions.h"

@implementation AAOptions

AAPropSetFuncImplementation(AAOptions, AAChart       *, chart);
AAPropSetFuncImplementation(AAOptions, AATitle       *, title);
AAPropSetFuncImplementation(AAOptions, AASubtitle    *, subtitle);
AAPropSetFuncImplementation(AAOptions, AAXAxis       *, xAxis);
AAPropSetFuncImplementation(AAOptions, AAYAxis       *, yAxis);
AAPropSetFuncImplementation(AAOptions, AATooltip     *, tooltip);
AAPropSetFuncImplementation(AAOptions, AAPlotOptions *, plotOptions);
AAPropSetFuncImplementation(AAOptions, NSArray       *, series);
AAPropSetFuncImplementation(AAOptions, AALegend      *, legend);
AAPropSetFuncImplementation(AAOptions, NSArray       *, colors);
AAPropSetFuncImplementation(AAOptions, BOOL,            gradientColorEnabled);
AAPropSetFuncImplementation(AAOptions, NSString      *, zoomResetButtonText); //String to display in 'zoom reset button"

@end


#define AAFontSizeFormat(fontSize) [NSString stringWithFormat:@"%@%@", fontSize, @"px"]

@implementation AAOptionsConstructor

+ (AAOptions *)configureChartOptionsWithAAChartModel:(AAChartModel *)aaChartModel {
    
    AAChart *aaChart = AAObject(AAChart)
    .typeSet(aaChartModel.chartType)//็ปๅพ็ฑปๅ
    .invertedSet(aaChartModel.inverted)//่ฎพ็ฝฎๆฏๅฆๅ่ฝฌๅๆ?่ฝด๏ผไฝฟX่ฝดๅ็ด๏ผY่ฝดๆฐดๅนณใ ๅฆๆๅผไธบ true๏ผๅ x ่ฝด้ป่ฎคๆฏ ๅ็ฝฎ ็ใ ๅฆๆๅพ่กจไธญๅบ็ฐๆกๅฝขๅพ็ณปๅ๏ผๅไผ่ชๅจๅ่ฝฌ
    .backgroundColorSet(aaChartModel.backgroundColor)//่ฎพ็ฝฎๅพ่กจ็่ๆฏ่ฒ(ๅๅซ้ๆๅบฆ็่ฎพ็ฝฎ)
    .pinchTypeSet(aaChartModel.zoomType)//่ฎพ็ฝฎๆๅฟ็ผฉๆพๆนๅ
    .panningSet(true)//่ฎพ็ฝฎๆๅฟ็ผฉๆพๅๆฏๅฆๅฏๅนณ็งป
    .polarSet(aaChartModel.polar);
    
    if (aaChartModel.options3dEnabled == true) {
        aaChart.options3d = (AAObject(AAOptions3d)
                             .enabledSet(aaChartModel.options3dEnabled)
                             .alphaSet(@(-15))
                             );
    }
    
    AATitle *aaTitle = AAObject(AATitle)
    .textSet(aaChartModel.title)//ๆ?้ขๆๆฌๅๅฎน
    .styleSet(AAObject(AAStyle)
              .colorSet(aaChartModel.titleFontColor)//Title font color
              .fontSizeSet(AAFontSizeFormat(aaChartModel.titleFontSize))//Title font size
              .fontWeightSet(aaChartModel.titleFontWeight)//Title font weight
              );
    
    AASubtitle *aaSubtitle = AAObject(AASubtitle)
    .textSet(aaChartModel.subtitle)//ๅฏๆ?้ขๅๅฎน
    .alignSet(aaChartModel.subtitleAlign)//ๅพ่กจๅฏๆ?้ขๆๆฌๆฐดๅนณๅฏน้ฝๆนๅผใๅฏ้็ๅผๆ โleftโ๏ผโcenterโๅโrightโใ ้ป่ฎคๆฏ๏ผcenter.
    .styleSet(AAObject(AAStyle)
              .colorSet(aaChartModel.subtitleFontColor)//Subtitle font color
              .fontSizeSet(AAFontSizeFormat(aaChartModel.subtitleFontSize))//Subtitle font size
              .fontWeightSet(aaChartModel.subtitleFontWeight)//Subtitle font weight
              );
    
    AATooltip *aaTooltip = AAObject(AATooltip)
    .enabledSet(aaChartModel.tooltipEnabled)//ๅฏ็จๆตฎๅจๆ็คบๆก
    .sharedSet(true)//ๅค็ปๆฐๆฎๅฑไบซไธไธชๆตฎๅจๆ็คบๆก
    .crosshairsSet(true)//ๅฏ็จๅๆ็บฟ
    //.pointFormatSet(aaChartModel.tooltipValueString)//Tooltip value point format string
    .valueSuffixSet(aaChartModel.tooltipValueSuffix);//ๆตฎๅจๆ็คบๆก็ๅไฝๅ็งฐๅ็ผ
    
    AAPlotOptions *aaPlotOptions = AAObject(AAPlotOptions)
    .seriesSet(AAObject(AASeries)
               //             .colorByPointSet(false)//ๅณๅฎไบๅพ่กจๆฏๅฆ็ปๆฏไธชๆฐๆฎๅๆๆฏไธช็นๅ้ไธไธช้ข่ฒ๏ผ้ป่ฎคๅผๆฏ false๏ผ ๅณ้ป่ฎคๆฏ็ปๆฏไธชๆฐๆฎ็ฑปๅ้้ข่ฒ๏ผ
               .stackingSet(aaChartModel.stacking)//่ฎพ็ฝฎๆฏๅฆ็พๅๆฏๅ?ๅ?ๆพ็คบๅพๅฝข
               .keysSet(aaChartModel.keys)//Support for keys
               );
    
    if (aaChartModel.animationType != 0) {
        NSString *chartAnimationType = [self configureTheEasingAnimationType:aaChartModel.animationType];
        aaPlotOptions.series.animation = (AAObject(AAAnimation)
                                          .easingSet(chartAnimationType)
                                          .durationSet(aaChartModel.animationDuration)
                                          );
    }
    
    [self configureTheStyleOfConnectNodeWithChartModel:aaChartModel plotOptions:aaPlotOptions];
    aaPlotOptions = [self configureTheAAPlotOptionsWithPlotOptions:aaPlotOptions chartModel:aaChartModel];
    //   aaPlotOptions.series.events = @{@"click":@"hahaha"};
    
    AALegend *aaLegend = AAObject(AALegend)
    .enabledSet(aaChartModel.legendEnabled)//ๆฏๅฆๆพ็คบ legend
    .layoutSet(AALegendLayoutTypeHorizontal)//ๅพไพๆฐๆฎ้กน็ๅธๅฑใๅธๅฑ็ฑปๅ๏ผ "horizontal" ๆ "vertical" ๅณๆฐดๅนณๅธๅฑๅๅ็ดๅธๅฑ ้ป่ฎคๆฏ๏ผhorizontal.
    .alignSet(AALegendAlignTypeCenter)//่ฎพๅฎๅพไพๅจๅพ่กจๅบไธญ็ๆฐดๅนณๅฏน้ฝๆนๅผ๏ผๅๆณๅผๆleft๏ผcenter ๅ rightใ
    .verticalAlignSet(AALegendVerticalAlignTypeBottom)//่ฎพๅฎๅพไพๅจๅพ่กจๅบไธญ็ๅ็ดๅฏน้ฝๆนๅผ๏ผๅๆณๅผๆ top๏ผmiddle ๅ bottomใๅ็ดไฝ็ฝฎๅฏไปฅ้่ฟ y ้้กนๅ่ฟไธๆญฅ่ฎพๅฎใ
    .itemMarginTopSet(@0);//ๅพไพ็ๆฏไธ้กน็้กถ้จๅค่พน่ท๏ผๅไฝpxใ ้ป่ฎคๆฏ๏ผ0.
    
    AAOptions *aaOptions = AAObject(AAOptions)
    .chartSet(aaChart)
    .titleSet(aaTitle)
    .subtitleSet(aaSubtitle)
    .tooltipSet(aaTooltip)
    .plotOptionsSet(aaPlotOptions)
    .legendSet(aaLegend)
    .seriesSet(aaChartModel.series)
    .colorsSet(aaChartModel.colorsTheme)//่ฎพ็ฝฎ้ข่ฒไธป้ข
    .gradientColorEnabledSet(aaChartModel.gradientColorEnabled)//่ฎพ็ฝฎไธป้ข้ข่ฒๆฏๅฆไธบๆธๅ่ฒ
    .zoomResetButtonTextSet(aaChartModel.zoomResetButtonText);//่ฎพ็ฝฎ้็ฝฎ็ผฉๆพๆ้ฎ็้ป่ฎคๆ?้ข
    
    if (   ![aaChartModel.chartType isEqualToString:AAChartTypePie]
        && ![aaChartModel.chartType isEqualToString:AAChartTypePyramid]
        && ![aaChartModel.chartType isEqualToString:AAChartTypeFunnel]) {
        AAXAxis *aaXAxis = AAObject(AAXAxis);
        AAYAxis *aaYAxis = AAObject(AAYAxis);
        [self configureAxisContentAndStyleWithAAXAxis:aaXAxis AAYAxis:aaYAxis AAChartModel:aaChartModel];
        aaOptions.xAxis = aaXAxis;
        aaOptions.yAxis = aaYAxis;
    }
    
    return aaOptions;
}

+ (void)configureAxisContentAndStyleWithAAXAxis:(AAXAxis *)aaXAxis AAYAxis:(AAYAxis *)aaYAxis AAChartModel:(AAChartModel *)aaChartModel {
    
    aaXAxis.labelsSet(AAObject(AALabels)
                      .enabledSet(aaChartModel.xAxisLabelsEnabled)//่ฎพ็ฝฎ x ่ฝดๆฏๅฆๆพ็คบๆๅญ
                      .styleSet(AAObject(AAStyle)
                                .colorSet(aaChartModel.xAxisLabelsFontColor)//xAxis Label font color
                                .fontSizeSet(AAFontSizeFormat(aaChartModel.xAxisLabelsFontSize))//xAxis Label font size
                                .fontWeightSet(aaChartModel.xAxisLabelsFontWeight)//xAxis Label font weight
                                )
                      )
    .reversedSet(aaChartModel.xAxisReversed)
    .gridLineWidthSet(aaChartModel.xAxisGridLineWidth)//x่ฝด็ฝๆ?ผ็บฟๅฎฝๅบฆ
    .categoriesSet(aaChartModel.categories)
    .visibleSet(aaChartModel.xAxisVisible)//x่ฝดๆฏๅฆๅฏ่ง
    .tickIntervalSet(aaChartModel.xAxisTickInterval);//x่ฝดๅๆ?็น้ด้ๆฐ
    
    if ([aaChartModel.xAxisCrosshairWidth floatValue]>0) {
        aaXAxis.crosshairSet(AAObject(AACrosshair)
                             .widthSet(aaChartModel.xAxisCrosshairWidth)
                             .colorSet(aaChartModel.xAxisCrosshairColor)
                             .dashStyleSet(aaChartModel.xAxisCrosshairDashStyleType)
                             );
    }
    
    aaYAxis.labelsSet(AAObject(AALabels)
                      .enabledSet(aaChartModel.yAxisLabelsEnabled)//่ฎพ็ฝฎ y ่ฝดๆฏๅฆๆพ็คบๆฐๅญ
                      .styleSet(AAObject(AAStyle)
                                .colorSet(aaChartModel.yAxisLabelsFontColor)//yAxis Label font color
                                .fontSizeSet(AAFontSizeFormat(aaChartModel.yAxisLabelsFontSize))//yAxis Label font size
                                .fontWeightSet(aaChartModel.yAxisLabelsFontWeight)//yAxis Label font weight
                                )
                      .formatSet(@"{value:.,0f}")//่ฎฉy่ฝด็ๅผๅฎๆดๆพ็คบ ่ไธๆฏ100000ๆพ็คบไธบ100k
                      )
    .minSet(aaChartModel.yAxisMin)//่ฎพ็ฝฎ y ่ฝดๆๅฐๅผ,ๆๅฐๅผ็ญไบ้ถๅฐฑไธ่ฝๆพ็คบ่ดๅผไบ
    .maxSet(aaChartModel.yAxisMax)//y่ฝดๆๅคงๅผ
    .tickPositionsSet(aaChartModel.yAxisTickPositions)//่ชๅฎไนY่ฝดๅๆ?
    .allowDecimalsSet(aaChartModel.yAxisAllowDecimals)//ๆฏๅฆๅ่ฎธๆพ็คบๅฐๆฐ
    .plotLinesSet(aaChartModel.yAxisPlotLines) //ๆ?็คบ็บฟ่ฎพ็ฝฎ
    .reversedSet(aaChartModel.yAxisReversed)
    .gridLineWidthSet(aaChartModel.yAxisGridLineWidth)//y่ฝด็ฝๆ?ผ็บฟๅฎฝๅบฆ
    .titleSet(AAObject(AATitle)
              .textSet(aaChartModel.yAxisTitle))//y ่ฝดๆ?้ข
    .lineWidthSet(aaChartModel.yAxisLineWidth)//่ฎพ็ฝฎ y่ฝด่ฝด็บฟ็ๅฎฝๅบฆ,ไธบ0ๅณๆฏ้่ y่ฝด่ฝด็บฟ
    .visibleSet(aaChartModel.yAxisVisible)
    .tickIntervalSet(aaChartModel.yAxisTickInterval);
    
    if ([aaChartModel.yAxisCrosshairWidth floatValue]>0) {
        aaYAxis.crosshairSet(AAObject(AACrosshair)
                             .widthSet(aaChartModel.yAxisCrosshairWidth)
                             .colorSet(aaChartModel.yAxisCrosshairColor)
                             .dashStyleSet(aaChartModel.yAxisCrosshairDashStyleType)
                             );
    }
    
}

+ (void)configureTheStyleOfConnectNodeWithChartModel:(AAChartModel *)aaChartModel plotOptions:(AAPlotOptions *)aaPlotOptions {
    //ๆฐๆฎ็นๆ?่ฎฐ็ธๅณ้็ฝฎ๏ผๅชๆ็บฟๆงๅพ(ๆ็บฟๅพใๆฒ็บฟๅพใๆ็บฟๅบๅๅกซๅๅพใๆฒ็บฟๅบๅๅกซๅๅพ)ๆๆๆฐๆฎ็นๆ?่ฎฐ
    if (   [aaChartModel.chartType isEqualToString:AAChartTypeArea]
        || [aaChartModel.chartType isEqualToString:AAChartTypeAreaspline]
        || [aaChartModel.chartType isEqualToString:AAChartTypeLine]
        || [aaChartModel.chartType isEqualToString:AAChartTypeSpline]) {
        AAMarker *aaMarker = AAObject(AAMarker)
        .radiusSet(aaChartModel.markerRadius)//ๆฒ็บฟ่ฟๆฅ็นๅๅพ๏ผ้ป่ฎคๆฏ4
        .symbolSet(aaChartModel.symbol);//ๆฒ็บฟ็น็ฑปๅ๏ผ"circle", "square", "diamond", "triangle","triangle-down"๏ผ้ป่ฎคๆฏ"circle"
        if (aaChartModel.symbolStyle == AAChartSymbolStyleTypeInnerBlank) {
            aaMarker.fillColorSet(@"#ffffff")//็น็ๅกซๅ่ฒ(็จๆฅ่ฎพ็ฝฎๆ็บฟ่ฟๆฅ็น็ๅกซๅ่ฒ)
            .lineWidthSet(@2)//ๅคๆฒฟ็บฟ็ๅฎฝๅบฆ(็จๆฅ่ฎพ็ฝฎๆ็บฟ่ฟๆฅ็น็่ฝฎๅปๆ่พน็ๅฎฝๅบฆ)
            .lineColorSet(@"");//ๅคๆฒฟ็บฟ็้ข่ฒ(็จๆฅ่ฎพ็ฝฎๆ็บฟ่ฟๆฅ็น็่ฝฎๅปๆ่พน้ข่ฒ๏ผๅฝๅผไธบ็ฉบๅญ็ฌฆไธฒๆถ๏ผ้ป่ฎคๅๆฐๆฎ็นๆๆฐๆฎๅ็้ข่ฒ)
        } else if (aaChartModel.symbolStyle == AAChartSymbolStyleTypeBorderBlank) {
            aaMarker.lineWidthSet(@2)
            .lineColorSet(aaChartModel.backgroundColor);
        }
        AASeries *aaSeries = aaPlotOptions.series;
        aaSeries.connectNulls = aaChartModel.connectNulls;
        aaSeries.marker = aaMarker;
    }
}

+ (NSString *)configureTheEasingAnimationType:(AAChartAnimation)animationType {
    
    switch (animationType) {
        case AAChartAnimationLinear :
            return @"linear";
        case AAChartAnimationEaseInQuad:
            return @"easeInQuad";
        case AAChartAnimationEaseOutQuad:
            return @"easeOutQuad";
        case AAChartAnimationEaseInOutQuad:
            return @"easeInOutQuad";
        case AAChartAnimationEaseInCubic:
            return @"easeInCubic";
        case AAChartAnimationEaseOutCubic:
            return @"easeOutCubic";
        case AAChartAnimationEaseInOutCubic:
            return @"easeInOutCubic";
        case AAChartAnimationEaseInQuart:
            return @"easeInQuart";
        case AAChartAnimationEaseOutQuart:
            return @"easeOutQuart";
        case AAChartAnimationEaseInOutQuart:
            return @"easeInOutQuart";
        case AAChartAnimationEaseInQuint:
            return @"easeInQuint";
        case AAChartAnimationEaseOutQuint:
            return @"easeOutQuint";
        case AAChartAnimationEaseInOutQuint:
            return @"easeInOutQuint";
        case AAChartAnimationEaseInSine:
            return @"easeInSine";
        case AAChartAnimationEaseOutSine:
            return @"easeOutSine";
        case AAChartAnimationEaseInOutSine:
            return @"easeInOutSine";
        case AAChartAnimationEaseInExpo:
            return @"easeInExpo";
        case AAChartAnimationEaseOutExpo:
            return @"easeOutExpo";
        case AAChartAnimationEaseInOutExpo:
            return @"easeInOutExpo";
        case AAChartAnimationEaseInCirc:
            return @"easeInCirc";
        case AAChartAnimationEaseOutCirc:
            return @"easeOutCirc";
        case AAChartAnimationEaseInOutCirc:
            return @"easeInOutCirc";
        case AAChartAnimationEaseOutBounce:
            return @"easeOutBounce";
        case AAChartAnimationEaseInBack:
            return @"easeInBack";
        case AAChartAnimationEaseOutBack:
            return @"easeOutBack";
        case AAChartAnimationEaseInOutBack:
            return @"easeInOutBack";
        case AAChartAnimationElastic:
            return @"elastic";
        case AAChartAnimationSwingFromTo:
            return @"swingFromTo";
        case AAChartAnimationSwingFrom:
            return @"swingFrom";
        case AAChartAnimationSwingTo:
            return @"swingTo";
        case AAChartAnimationBounce:
            return @"bounce";
        case AAChartAnimationBouncePast:
            return @"bouncePast";
        case AAChartAnimationEaseFromTo:
            return @"easeFromTo";
        case AAChartAnimationEaseFrom:
            return @"easeFrom";
        case AAChartAnimationEaseTo:
            return @"easeTo";
    };
}

+ (AAPlotOptions *)configureTheAAPlotOptionsWithPlotOptions:(AAPlotOptions *)aaPlotOptions chartModel:(AAChartModel *)aaChartModel {
    
    AAChartType chartType = aaChartModel.chartType;
    
    AADataLabels *aaDataLabels;
    if (aaChartModel.dataLabelEnabled == true) {
        aaDataLabels = (AAObject(AADataLabels)
                        .enabledSet(aaChartModel.dataLabelEnabled)
                        .styleSet(AAObject(AAStyle)
                                  .colorSet(aaChartModel.dataLabelFontColor)
                                  .fontSizeSet(AAFontSizeFormat(aaChartModel.dataLabelFontSize))
                                  .fontWeightSet(aaChartModel.dataLabelFontWeight)
                                  )
                        .rotationSet(aaChartModel.dataLabelRotation)
                        .allowOverlapSet(aaChartModel.dataLabelAllowOverlap)
                        //(Note: if rotation <> 0, 'dataLabelAllowOverlap' will not work - this is a bug in HighCharts (https://github.com/highcharts/highcharts/issues/7362)
                        );
    }
    
    if ([chartType isEqualToString:AAChartTypeColumn]) {
        AAColumn *aaColumn = (AAObject(AAColumn)
                              .borderWidthSet(@0)
                              //.groupPaddingSet(@0.05)
                              .borderRadiusSet(aaChartModel.borderRadius)
                              .dataLabelsSet(aaDataLabels));
        if (aaChartModel.polar == YES) {
            aaColumn.pointPaddingSet(@0)
            .groupPaddingSet(@0.005);
        }
        aaPlotOptions.columnSet(aaColumn);
    } else if ([chartType isEqualToString:AAChartTypeBar]) {
        AABar *aaBar = (AAObject(AABar)
                        .borderWidthSet(@0)
                        //.groupPaddingSet(@0.1)
                        .borderRadiusSet(aaChartModel.borderRadius)
                        .dataLabelsSet(aaDataLabels));
        if (aaChartModel.polar == YES) {
            aaBar.pointPaddingSet(@0)
            .groupPaddingSet(@0.005);
        }
        aaPlotOptions.barSet(aaBar);
    } else if ([chartType isEqualToString:AAChartTypeArea]) {
        aaPlotOptions.areaSet(AAObject(AAArea)
                              .dataLabelsSet(aaDataLabels));
    } else if ([chartType isEqualToString:AAChartTypeAreaspline]) {
        aaPlotOptions.areasplineSet(AAObject(AAAreaspline)
                                    .dataLabelsSet(aaDataLabels));
    } else if ([chartType isEqualToString:AAChartTypeLine]) {
        aaPlotOptions.lineSet(AAObject(AALine)
                              .dataLabelsSet(aaDataLabels));
    } else if ([chartType isEqualToString:AAChartTypeSpline]) {
        aaPlotOptions.splineSet(AAObject(AASpline)
                                .dataLabelsSet(aaDataLabels));
    } else if ([chartType isEqualToString:AAChartTypePie]) {
        aaPlotOptions.pieSet(AAObject(AAPie)
                             //.sizeSet(@50)
                             .allowPointSelectSet(true)
                             .cursorSet(@"pointer")
                             .showInLegendSet(true)
                             .dataLabelsSet(aaDataLabels
                                            .formatSet(@"<b>{point.name}</b>: {point.percentage:.1f} %")
                                            )
        );
        if (aaChartModel.options3dEnabled == true) {
            aaPlotOptions.pie.depth = aaChartModel.options3dDepth;//่ฎพ็ฝฎ3d ๅพๅฝข้ดๅฝฑๆทฑๅบฆ
        }
    } else if ([chartType isEqualToString:AAChartTypeColumnrange]) {
        NSMutableDictionary *columnRangeDic = [[NSMutableDictionary alloc]init];
        [columnRangeDic setValue:@0 forKey:@"borderRadius"];//The color of the border surrounding each column or bar
        [columnRangeDic setValue:@0 forKey:@"borderWidth"];//The corner radius of the border surrounding each column or bar. default๏ผ0.
        [columnRangeDic setValue:aaDataLabels forKey:@"dataLabels"];
        aaPlotOptions.columnrangeSet(columnRangeDic);
    } else if ([chartType isEqualToString:AAChartTypeArearange]) {
        NSDictionary *areaRangeDic = [[NSMutableDictionary alloc]init];
        [areaRangeDic setValue:aaDataLabels forKey:@"dataLabels"];
        aaPlotOptions.arearangeSet(areaRangeDic);
    }
    return aaPlotOptions;
}

@end


