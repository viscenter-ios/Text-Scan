//
//  Text_ScanAppDelegate.h
//  Text Scan
//
//  Created by Zach Whelchel on 1/6/11.
//  Copyright 2011 Asbury College. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Text_ScanViewController;

@interface Text_ScanAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Text_ScanViewController *viewController;
	
	float i;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Text_ScanViewController *viewController;

@property (nonatomic) float i;

@end

