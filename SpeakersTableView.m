//
//  SpeakersTableView.m
//  IOSProject
//
//  Created by JETS on 4/11/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import "SpeakersTableView.h"
#import "NetWorkHandler.h"
#import "JETSSpeaker.h"
#import "JETSProfile.h"
#import "JETSExhibitor.h"

NSDictionary *mydic;
UIActivityIndicatorView *activity;
@interface SpeakersTableView ()

@end

@implementation SpeakersTableView

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
    // 1- load getSpeakerMethod
     NetWorkHandler *net=[NetWorkHandler new];
    mydic = [net getSpeakersWithEmail:@"eng.medhat.cs.h@gmail.com"];
    */
    
    
   /*
    // 2- load getProfile Method
    NetWorkHandler *net=[NetWorkHandler new];
    
    mydic = [net getProfileWithName:@"eng.medhat.cs.h@gmail.com" andPassword:@"medhat123"];
    */
    
    
    
    /*
    // 3-  load getsession Method
    NetWorkHandler *net=[NetWorkHandler new];
    mydic = [net getSessionsWithEmail:@"eng.medhat.cs.h@gmail.com"];
    */
    
    // 4- load getExhibtors Method
    NetWorkHandler *net=[NetWorkHandler new];
    mydic = [net getExhibitorWithEmail:@"eng.medhat.cs.h@gmail.com"];
   
  
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

@end
