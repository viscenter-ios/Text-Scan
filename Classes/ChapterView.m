//
//  BookmarkView.m
//  Iliad
//
//  Created by Vis Center on 7/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ChapterView.h"
#import "Text_ScanAppDelegate.h"


@implementation ChapterView


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	self.contentSizeForViewInPopover = CGSizeMake(280, 163);
	
		
    [super viewDidLoad];
}


- (void) viewDidDisappear:(BOOL)animated {
	
	
}

- (void) viewWillAppear:(BOOL)animated {

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Override to allow orientations other than the default portrait orientation.
    return YES;
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 2;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	cell.selectionStyle = UITableViewCellSelectionStyleGray;
	
	
	if (indexPath.row == 0) {
		cell.text = @"Saint Chad Gospels";

	}
	
	else if (indexPath.row == 1) {
		cell.text = @"Chinese Text";
		
	}
	
    return cell;
}




- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath 
{ 
	Text_ScanAppDelegate *mainDelegate = (Text_ScanAppDelegate *)[[UIApplication sharedApplication]delegate];
		
	
	
	if (indexPath.row == 0) {
		if (mainDelegate.i == 0) {
			return UITableViewCellAccessoryCheckmark; 

		}
		else {
			return UITableViewCellAccessoryNone; 

		}


	}

	else {
		if (mainDelegate.i == 1) {
			return UITableViewCellAccessoryCheckmark; 
			
		}
		else {
			return UITableViewCellAccessoryNone; 
			
		}
	}

} 



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	
	Text_ScanAppDelegate *mainDelegate = (Text_ScanAppDelegate *)[[UIApplication sharedApplication]delegate];

	int i = indexPath.row;

	mainDelegate.i = i;
	
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"UpdatePages"
														object:indexPath
													  userInfo:nil];
	
	
}


	



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

