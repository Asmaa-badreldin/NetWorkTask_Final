//
//  NetWorkHandler.h
//  IOSProject
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkDelegate.h"

@interface NetWorkHandler : NSObject

@property id<NetWorkDelegate> netDelegate;

-(NSDictionary *) getSpeakersWithEmail:(NSString *)email;
@property NSMutableArray *speakers;

-(NSDictionary *) loginWithEmail:(NSString *)email andPassword:(NSString *)pass;
-(NSDictionary *) getProfileWithEmail:(NSString *)email;
@property NSMutableArray *profiles;


-(NSDictionary *)getSessionsWithEmail:(NSString *)email;

-(NSDictionary *) getExhibitorWithEmail:(NSString *)email;
@property NSMutableArray *exhibitor;

@end
