//
//  Text_ScanViewController.m
//  Text Scan
//
//  Created by Zach Whelchel on 1/6/11.
//  Copyright 2011 Asbury College. All rights reserved.
//

#import "Text_ScanViewController.h"

#import <QuartzCore/QuartzCore.h>
#import "ChapterView.h"

@implementation Text_ScanViewController


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	topUp = NO;
	
	currentImageWidth = 863;
	currentImageHeight = 509;
	barHeight = 109;
	
	
	
	CGRect b = lbl1.frame;
	CGRect c = lbl2.frame;
	b.origin.y = 319 - 176 - 40;
	c.origin.y = 319 + 112 + 40;
	lbl1.frame = b;
	lbl2.frame = c;
	
	pageOn = 0;
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(newStuff:)
												 name:@"UpdatePages" object:nil];

	[super viewDidLoad];
	
	ymoved = 0;

	
	//UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Chadreplaceold.jpg"]];
	
	
	[self setupImage];
	
	

}

- (void) setupImage {
	
	imageView = [[UIImageView alloc] initWithFrame:CGRectMake((1024 - currentImageWidth)/2, (748 -currentImageHeight)/2,currentImageWidth,currentImageHeight)];
	
	[imageView setImage:[UIImage imageNamed:@"Chadreplaceold.jpg"]];
	imageView.contentMode=UIViewContentModeTop;
	imageView.layer.cornerRadius = 0.0;
	imageView.layer.masksToBounds = YES;
	imageView.layer.borderColor = [UIColor blackColor].CGColor;
	imageView.layer.borderWidth = 2.0;
	
	
	UIView* shadowView = [[UIView alloc] init];
	shadowView.layer.cornerRadius = 5.0;
    shadowView.layer.shadowColor = [[UIColor blackColor] CGColor];
    shadowView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    shadowView.layer.shadowOpacity = 0.7f;
    shadowView.layer.shadowRadius = 4.0f;
	[shadowView addSubview:imageView];
	
	[self.view addSubview:shadowView];
	
	
	
	imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake((1024 - currentImageWidth)/2, (748 -currentImageHeight)/2,currentImageWidth,currentImageHeight/2)];
	
	
	[imageView2 setImage:[UIImage imageNamed:@"Chadreplacenew.jpg"]];
	imageView2.contentMode=UIViewContentModeTop;
	imageView2.layer.cornerRadius = 0.0;
	imageView2.layer.masksToBounds = YES;
	imageView2.layer.borderColor = [UIColor blackColor].CGColor;
	imageView2.layer.borderWidth = 2.0;
	
	[self.view addSubview:imageView2];
	
	
	btnTwo = [UIButton buttonWithType:UIButtonTypeCustom]; 
	btnTwo.userInteractionEnabled = NO;
	btnTwo.frame = CGRectMake(0, 374 - barHeight/2 - 2, 1024, 109);
	[btnTwo setImage:[UIImage imageNamed:@"red2new.png"] forState:UIControlStateNormal];
	[self.view addSubview:btnTwo];
}



- (void) newStuff: (NSNotification *)notification {

	[chaptersPop dismissPopoverAnimated:YES];

	
	filters.selectedSegmentIndex = 0;
	
	lbl1.alpha = 1;
	lbl2.alpha = 1;

	
	NSIndexPath *indexPath;
	indexPath = [notification object];
	
	if (indexPath.row == 1) {
		NSLog (@"%.i",indexPath.row);
		
		NSLog (@"0",indexPath.row);
		[imageView setImage:[UIImage imageNamed:@"Manuscript_Detail_ORIGINAL.jpg"]];
		[imageView2 setImage:[UIImage imageNamed:@"Manuscript_Detail_Manipulated.jpg"]];
		
		
		currentImageWidth = 692;
		currentImageHeight = 542;
		
		
		[lbl1 setImage:[UIImage imageNamed:@"simp.png"]];
		[lbl2 setImage:[UIImage imageNamed:@"trad.png"]];
		CGRect b = lbl1.frame;
		CGRect c = lbl2.frame;
		b.origin.y = 319 - 176 - 40;
		c.origin.y = 319 + 112 + 40;
		lbl1.frame = b;
		lbl2.frame = c;
		
		pageOn = 1;
		

	}
	else {
		[imageView setImage:[UIImage imageNamed:@"Chadreplaceold.jpg"]];
		[imageView2 setImage:[UIImage imageNamed:@"Chadreplacenew.jpg"]];
		

		
		currentImageWidth = 863;
		currentImageHeight = 509;
		
		
		[lbl1 setImage:[UIImage imageNamed:@"eng.png"]];
		[lbl2 setImage:[UIImage imageNamed:@"lat.png"]];
		CGRect b = lbl1.frame;
		CGRect c = lbl2.frame;
		b.origin.y = 319 - 176 - 40;
		c.origin.y = 319 + 112 + 40;
		lbl1.frame = b;
		lbl2.frame = c;
		pageOn = 0;

	}

	
	[imageView setFrame:CGRectMake((1024 - currentImageWidth)/2, (748 -currentImageHeight)/2,currentImageWidth,currentImageHeight)];
	[imageView2 setFrame:CGRectMake((1024 - currentImageWidth)/2, (748 -currentImageHeight)/2,currentImageWidth,currentImageHeight/2)];
	[btnTwo setFrame:CGRectMake(0, 374 - barHeight/2 - 2, 1024, 109)];
	
	
	//NSLog (@"%.i",indexPath.row);

	
}





- (IBAction) chaptersClicked {
//	CGRect point = chaptersButtonRP1.frame;
	ChapterView *cViewController = [[ChapterView alloc] init];
	cViewController.navigationItem.title = @"Images";
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:cViewController];
	chaptersPop = [[UIPopoverController alloc] initWithContentViewController:navController];
	[chaptersPop presentPopoverFromRect:CGRectMake(0, 56, 0, 0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
	[chaptersPop setPopoverContentSize:CGSizeMake(280, 200)];
}




- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	//ymoved = 0;

	/*
	UITouch *touch = [event.allTouches anyObject];
	CGPoint touchPoint = [touch locationInView:self.view];

	CGRect a = btnTwo.frame;
	
	ystart = touchPoint.y - 54;
	NSLog(@"%.f", ystart - 75);
	
	
	
	y = touchPoint.y - 44;
	
	NSLog(@"This is Y: %.i", y);
*/
	UITouch *touch = [event.allTouches anyObject];
	
	CGPoint touchPoint = [touch locationInView:self.view];
	
	CGRect a = btnTwo.frame;
	
	CGRect b = lbl1.frame;
	CGRect c = lbl2.frame;
	
	ystart = touchPoint.y - (barHeight/2);
	
	
	//y = touchPoint.y;
	
	NSLog(@"This is Y: %.i", y);
	
	
	if (ystart > (748 -currentImageHeight)/2 - 56 && ystart < (748 -currentImageHeight)/2 + currentImageHeight - 56) {
		[imageView2 setFrame:CGRectMake((1024 - currentImageWidth)/2, (748 -currentImageHeight)/2,currentImageWidth,ystart- (638 - currentImageHeight)/2)]; 
		
		a.origin.y = ystart;
		
		if ((ystart-20)/2 - 44 > 50) {
			
			b.origin.y = (ystart-20)/2 - 44;// - 176;
			lbl1.frame = b;
			
			
			lbl1.alpha = 1;
			
		}
		else {
			
			b.origin.y = 50;// - 176;
			lbl1.frame = b;

			
			int i = ((ystart-20)/2 - 24);
			NSLog(@"THIS IS I: %.i",i);
			
			lbl1.alpha = i/70.00;
		}
		
		
		
		if ((728 - ystart + 67)/2 + ystart - 168/2 < 526) {
			
			c.origin.y = (728 - ystart + 67)/2 + ystart - 168/2;
			lbl2.frame = c;
			
			lbl2.alpha = 1;
		}
		else {
			
			c.origin.y = 524;// - 176;
			lbl2.frame = c;
			
			
			int i = (728 - ystart + 67)/2 + ystart - 168/2;
			NSLog(@"THIS IS I: %.i",i);
			
			
			lbl2.alpha = (600.00 - i) / 73.00;
		}
		
		
		
		btnTwo.frame = a;
	} 


}




- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
	
	UITouch *touch = [event.allTouches anyObject];

	CGPoint touchPoint = [touch locationInView:self.view];

	CGRect a = btnTwo.frame;

	CGRect b = lbl1.frame;
	CGRect c = lbl2.frame;

	ystart = touchPoint.y - (barHeight/2);
	
	
	//y = touchPoint.y;
	
	NSLog(@"This is Y: %.i", y);
	
	
	
	if (ystart > (748 -currentImageHeight)/2 - 56 && ystart < (748 -currentImageHeight)/2 + currentImageHeight - 56) {
		[imageView2 setFrame:CGRectMake((1024 - currentImageWidth)/2, (748 -currentImageHeight)/2,currentImageWidth,ystart- (638 - currentImageHeight)/2)]; 
		
		a.origin.y = ystart;
		
		if ((ystart-20)/2 - 44 > 50) {

			b.origin.y = (ystart-20)/2 - 44;// - 176;
			lbl1.frame = b;
	

			lbl1.alpha = 1;
			
		}
		else {
			int i = ((ystart-20)/2 - 24);
			NSLog(@"THIS IS I: %.i",i);
			
			lbl1.alpha = i/70.00;
		}

		
		
		if ((728 - ystart + 67)/2 + ystart - 168/2 < 526) {
			
			c.origin.y = (728 - ystart + 67)/2 + ystart - 168/2;
			lbl2.frame = c;
			
			lbl2.alpha = 1;
		}
		else {
			int i = (728 - ystart + 67)/2 + ystart - 168/2;
			NSLog(@"THIS IS I: %.i",i);
			
	
			lbl2.alpha = (600.00 - i) / 73.00;
		}

		
		
		
		
		
		btnTwo.frame = a;
	}
	
}

	
	
-(IBAction) filterSelected {
	
	if (pageOn == 0)
	{
	if (filters.selectedSegmentIndex == 0) {
		[imageView setImage:[UIImage imageNamed:@"Chadreplaceold.jpg"]];
		[imageView2 setImage:[UIImage imageNamed:@"Chadreplacenew.jpg"]];
	}
	else if (filters.selectedSegmentIndex == 1) {
		[imageView setImage:[UIImage imageNamed:@"Chadreplaceolduv.jpg"]];
		[imageView2 setImage:[UIImage imageNamed:@"Chadreplacenewuv.jpg"]];
	}
	else if (filters.selectedSegmentIndex == 2) {
		[imageView setImage:[UIImage imageNamed:@"Chadreplaceoldir.jpg"]];
		[imageView2 setImage:[UIImage imageNamed:@"Chadreplacenewir.jpg"]];
	}
	}
	else {
		if (filters.selectedSegmentIndex == 0) {
			[imageView setImage:[UIImage imageNamed:@"Manuscript_Detail_ORIGINAL.jpg"]];
			[imageView2 setImage:[UIImage imageNamed:@"Manuscript_Detail_Manipulated.jpg"]];
		}
		else if (filters.selectedSegmentIndex == 1) {
			[imageView setImage:[UIImage imageNamed:@"Manuscript_Detail_ORIGINALuv.jpg"]];
			[imageView2 setImage:[UIImage imageNamed:@"Manuscript_Detail_Manipulateduv.jpg"]];
		}
		else if (filters.selectedSegmentIndex == 2) {
			[imageView setImage:[UIImage imageNamed:@"Manuscript_Detail_ORIGINALir.jpg"]];
			[imageView2 setImage:[UIImage imageNamed:@"Manuscript_Detail_Manipulatedir.jpg"]];
		}
	}

	
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	
	ystart = 0;
	
	btnTwo.highlighted = NO;
	
}




// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	if(UIInterfaceOrientationIsPortrait(toInterfaceOrientation))
		return NO;
	else
		return YES;
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
