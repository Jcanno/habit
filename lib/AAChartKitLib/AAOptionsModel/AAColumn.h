//
//  AAColumn.h
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

@class AADataLabels;

@interface AAColumn : NSObject

AAPropStatementAndFuncStatement(assign, AAColumn, BOOL,           grouping);//Whether to group non-stacked columns or to let them render independent of each other. Non-grouped columns will be laid out individually and overlap each other. é»è®¤æ¯ï¼true.
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *,     pointPadding);
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *,     groupPadding);
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *,     borderWidth);
AAPropStatementAndFuncStatement(assign, AAColumn, BOOL,           colorByPoint);//å¯¹æ¯ä¸ªä¸åçç¹è®¾ç½®é¢è²(å½å¾è¡¨ç±»åä¸º AAColumn æ¶,è®¾ç½®ä¸º AAColumn å¯¹è±¡çå±æ§,å½å¾è¡¨ç±»åä¸º bar æ¶,åºè¯¥è®¾ç½®ä¸º bar å¯¹è±¡çå±æ§æææ)
AAPropStatementAndFuncStatement(strong, AAColumn, AADataLabels *, dataLabels);
AAPropStatementAndFuncStatement(copy,   AAColumn, NSString *,     stacking);
AAPropStatementAndFuncStatement(strong, AAColumn, NSNumber *,     borderRadius);

@end
