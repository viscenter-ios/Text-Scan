//
//  Text_ScanViewController.h
//  Text Scan
//
//  Created by Zach Whelchel on 1/6/11.
//  Copyright 2011 Asbury College. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Text_ScanViewController : UIViewController {

	UIButton *btnTwo;
	int ystart;
	int ymoved;
	
	int y;
	
	UIImageView* imageView2;
	
	UIPopoverController *chaptersPop;
	
	IBOutlet UIBarItem *chaptersButtonRP1;

	UIImageView* imageView;
	
	int pageOn;
	
	
	IBOutlet UIImageView *lbl1;
	IBOutlet UIImageView *lbl2;
	
	
	
	int currentImageWidth;
	int currentImageHeight;
	int barHeight;
	
	bool topUp;
	
	IBOutlet UISegmentedControl *filters;
}



-(IBAction) filterSelected;


-(IBAction) chaptersClicked;


@end

