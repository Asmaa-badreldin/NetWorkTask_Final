//
//  NetWorkHandler.m
//  IOSProject
//
//  Created by JETS on 4/10/16.
//  Copyright (c) 2016 ITI. All rights reserved.
//

#import "NetWorkHandler.h"
#import "AFNetworking.h"
#import "JETSSpeaker.h"
#import "JETSProfile.h"
#import "JETSAgenda.h"
#import "JETSSession.h"
#import "JETSExhibitor.h"

@implementation NetWorkHandler{
    NSDictionary *mydic;
}

-(NSDictionary *) loginWithEmail:(NSString *)email andPassword:(NSString *)pass{
    
    NSString *mystring = [NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/login?userName=%@&password=%@",email,pass];
    
    mydic = [NSDictionary new];
    NSURL *url = [NSURL URLWithString:mystring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        mydic= (NSDictionary *)responseObject;
        NSMutableDictionary *profileDic = [responseObject objectForKey:@"result"];
        JETSProfile *profile=[JETSProfile new];
        
        [profile setFirstName:[profileDic objectForKey:@"firstName"]];
        NSLog([profile firstName]);
        [profile setMiddleName:[profileDic objectForKey:@"middleName"]];
        NSLog([profile middleName]);
        [profile setLastName:[profileDic objectForKey:@"lastName"]];
        NSLog([profile lastName]);
        [profile setEmail:[profileDic objectForKey:@"email"]];
        NSLog([profile email]);      
        
        [_netDelegate handle: mydic];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
    
    [operation start];
    return mydic;
}

-(NSDictionary *) getProfileWithEmail:(NSString *)email{
    //geting url of webservice
       
    NSString *mystring = [NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/getAttendeeProfile?userName=%@",email];
    mydic = [NSDictionary new];
    NSURL *url = [NSURL URLWithString:mystring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        mydic= (NSDictionary *)responseObject;
        NSMutableDictionary *profileDic = [responseObject objectForKey:@"result"];
        JETSProfile *profile=[JETSProfile new];
    
        [profile setFirstName:[profileDic objectForKey:@"firstName"]];
        NSLog([profile firstName]);
        [profile setMiddleName:[profileDic objectForKey:@"middleName"]];
        NSLog([profile middleName]);
        [profile setLastName:[profileDic objectForKey:@"lastName"]];
        NSLog([profile lastName]);
        [profile setEmail:[profileDic objectForKey:@"email"]];
        NSLog([profile email]);
        [profile setCountryName:[profileDic objectForKey:@"country"]];
        NSLog([profile countryName]);
        [profile setCityName:[profileDic objectForKey:@"cityName"]];
        NSLog([profile cityName]);
        [profile setTitle:[profileDic objectForKey:@"title"]];
        NSLog([profile title]);
        [profile setImageURL:[profileDic objectForKey:@"imageURL"]];
        NSLog([profile imageURL]);
            
        NSMutableArray *ArrayOPhones = [profileDic objectForKey:@"phones"];
         for (int i2=1; i2<[ArrayOPhones count]; i2++) {
                NSMutableDictionary *phonesDict =[ArrayOPhones objectAtIndex:i2];
                [profile setPhones:[phonesDict objectForKey:@"phones"]];
                NSLog(@"phones are:");
                NSLog([profile phones]);
            }
            NSMutableArray *ArrayOfMobiles = [profileDic objectForKey:@"mobiles"];
            for (int i3=1; i3<[ArrayOfMobiles count]; i3++) {
                NSMutableDictionary *mobilesDict =[ArrayOfMobiles objectAtIndex:i3];
                [profile setMobiles:[mobilesDict objectForKey:@"mobiles"]];
                NSLog(@"mobiles are:");
                NSLog([profile mobiles]);
            }
        
        
        [_netDelegate handle: mydic];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
    
    [operation start];
    return mydic;
}



-(NSDictionary *) getSpeakersWithEmail:(NSString *)email{
    //geting url of webservice
    NSString *mystring = [NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/getSpeakers?userName=%@",email];
    mydic = [NSDictionary new];
    NSURL *url = [NSURL URLWithString:mystring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer =[AFJSONResponseSerializer serializer];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        mydic = (NSDictionary *)responseObject;
        NSLog([mydic objectForKey: @"status"]);
        
        NSMutableArray *arrayOfSpeakers = [mydic objectForKey:@"result"];
        
        
        
        for (int i=1; i<[arrayOfSpeakers count]; i++)
        {
            
            
            NSMutableDictionary *speakerDict = [arrayOfSpeakers objectAtIndex:i];
            
            JETSSpeaker *speaker = [JETSSpeaker new];
            
            [speaker setFirstName:[speakerDict objectForKey:@"firstName"]];
             NSLog([speaker firstName]);
            [speaker setMiddleName:[speakerDict objectForKey:@"middleName"]];
            NSLog([speaker middleName]);
            [speaker setLastName:[speakerDict objectForKey:@"lastName"]];
            NSLog([speaker lastName]);
            //[speaker setGender:[speakerDict objectForKey:@"gender"]];
           // NSLog([speaker gender]);
            [speaker setCompanyName:[speakerDict objectForKey:@"companyName"]];
            NSLog([speaker companyName]);
            [speaker setBiography:[speakerDict objectForKey:@"biography"]];
            NSLog([speaker biography]);
            [speaker setImageURL:[speakerDict objectForKey:@"imageURL"]];
            NSLog([speaker imageURL]);
            [speaker setTitle:[speakerDict objectForKey:@"title"]];
            NSLog([speaker title]);
            
            NSMutableArray *ArrayOPhones = [speakerDict objectForKey:@"phones"];
            for (int i2=1; i2<[ArrayOPhones count]; i2++) {
                NSMutableDictionary *phonesDict =[ArrayOPhones objectAtIndex:i2];
                [speaker setPhones:[phonesDict objectForKey:@"phones"]];
                NSLog(@"phones are:");
                NSLog([speaker phones]);
            }
            NSMutableArray *ArrayOfMobiles = [speakerDict objectForKey:@"mobiles"];
            for (int i3=1; i3<[ArrayOfMobiles count]; i3++) {
                NSMutableDictionary *mobilesDict =[ArrayOfMobiles objectAtIndex:i3];
                [speaker setMobiles:[mobilesDict objectForKey:@"mobiles"]];
                NSLog(@"mobiles are:");
                NSLog([speaker mobiles]);
            }

            [_speakers addObject:speaker];
        }
        
        
        [_netDelegate handle: mydic];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }];
    
    [operation start];
    return mydic;
}





-(NSDictionary *) getSessionsWithEmail:(NSString *)email{
 NSString *mystring = [NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/getSessions?userName=%@",email];
 
 mydic=[NSDictionary new];
 NSURL *url = [NSURL URLWithString:mystring];
 NSURLRequest *request = [NSURLRequest requestWithURL:url];
 
 // 2
 AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
 operation.responseSerializer = [AFJSONResponseSerializer serializer];
 
 [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
 
 // 3
 
 mydic= (NSDictionary *)responseObject;
 NSDictionary *dicOfResult = [mydic objectForKey:@"result"];
 NSMutableArray *agendas=[dicOfResult objectForKey:@"agendas"];
 NSMutableArray *arrayOfAgendas=[NSMutableArray new];
 
 for (int i=0; i<[agendas count]; i++) {
 
 NSMutableDictionary *agendaDict = [agendas objectAtIndex:i];
 JETSAgenda *agenda=[JETSAgenda new];
 NSString *dateString=[agendaDict objectForKey:@"date"];
 double getDate=[dateString doubleValue];
 [agenda setDate:getDate];
     NSLog(@":print long date %li",[agenda date]);
     
 NSMutableArray *sessions=[NSMutableArray new];
 sessions=[agendaDict objectForKey:@"sessions"];
 NSMutableArray *arrayOfSessions=[NSMutableArray new];
 for (int i=0; i<[sessions count]; i++) {
 NSMutableDictionary *sessionDict = [sessions objectAtIndex:i];
 JETSSession *session=[JETSSession new];
 [session setName:[sessionDict objectForKey:@"name"]];
 //NSLog([session name]);
 [session setId:[[sessionDict objectForKey:@"id"] integerValue]];
 [session setDescription:[sessionDict objectForKey:@"description"]];
     NSLog([session description]);
 [session setStatus:[[sessionDict objectForKey:@"status"] integerValue]];
 [session setSessionType:[sessionDict objectForKey:@"sessionType"]];
     NSLog([session sessionType]);
 [session setLiked:[[sessionDict objectForKey:@"like"] isEqualToString:@"true"]];
 [session setSessionTags:[sessionDict objectForKey:@"sessionTags"]];
 [session setSpeakers:[sessionDict objectForKey:@"speakers"]];
     
  NSString *sdateString=[sessionDict objectForKey:@"startDate"];
 double getsDate=[sdateString doubleValue];
 [session setStartDate:getsDate];
 NSLog(@"print long start date%li",[session date]);
     
 NSString *edateString=[sessionDict objectForKey:@"endDate"];
 double geteDate=[edateString doubleValue];
 [session setEndDate:getDate];
 NSLog(@"print long end date%li",[session date]);
     
 [arrayOfSessions addObject:session];
 }
 
 [agenda setSessions:arrayOfSessions];
 [arrayOfAgendas addObject:agenda];
 }
 
 [_netDelegate handle: mydic];
 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
 
 // 4
 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
 message:[error localizedDescription]
 delegate:nil
 cancelButtonTitle:@"Ok"
 otherButtonTitles:nil];
 [alertView show];
 }];
 
 // 5
 [operation start];
 return mydic;
 
 }


-(NSDictionary *)getExhibitorWithEmail:(NSString *)email
{
    NSString *myexhibitor=[NSString stringWithFormat:@"http://www.mobiledeveloperweekend.net/service/getExhibitors?userName=%@",email];
    mydic=[NSDictionary new];
    NSURL *myurl=[NSURL URLWithString:myexhibitor];
    NSURLRequest *myrequest=[NSURLRequest requestWithURL:myurl];
    AFHTTPRequestOperation *myoperation=[[AFHTTPRequestOperation alloc]initWithRequest:myrequest];
    myoperation.responseSerializer =[AFJSONResponseSerializer serializer];
    [myoperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *myoperation, id responseObject) {
        mydic = (NSDictionary *)responseObject;
        //NSLog([mydic objectForKey: @"status"]);
        
        NSMutableArray *arrayOfExhibitors = [mydic objectForKey:@"result"];
        for (int i=1; i<[arrayOfExhibitors count]; i++ ) {
            NSMutableDictionary *exhibitorDict = [arrayOfExhibitors objectAtIndex:i];
            JETSExhibitor *exhibitor=[JETSExhibitor new];
            
            [exhibitor setImageURL:[exhibitorDict objectForKey:@"imageURL"]];
            NSLog([exhibitor imageURL]);
            
            [exhibitor setCompanyAddress:[exhibitorDict objectForKey:@"companyAddress"]];
            NSLog([exhibitor companyAddress]);
            
            
            [exhibitor setCompanyAbout:[exhibitorDict objectForKey:@"companyAbout"]];
            NSLog([exhibitor companyAbout]);
            
            [exhibitor setFax:[exhibitorDict objectForKey:@"fax"]];
            NSLog([exhibitor fax]);
            
            [exhibitor setContactName:[exhibitorDict objectForKey:@"contactName"]];
            NSLog([exhibitor contactName]);
            
            [exhibitor setContactTitle:[exhibitorDict objectForKey:@"contactTitle"]];
            NSLog([exhibitor contactTitle]);
            
            [exhibitor setCompanyUrl:[exhibitorDict objectForKey:@"companyUrl"]];
            NSLog([exhibitor companyUrl]);
            
            [exhibitor setEmail:[exhibitorDict objectForKey:@"email"]];
            NSLog([exhibitor email]);
            
            [exhibitor setCountryName:[exhibitorDict objectForKey:@"countryName"]];
            NSLog([exhibitor countryName]);
            
            [exhibitor setCityName:[exhibitorDict objectForKey:@"cityName"]];
            NSLog([exhibitor cityName]);
            
            [exhibitor setCompanyName:[exhibitorDict objectForKey:@"companyName"]];
            NSLog([exhibitor companyName]);
            
            
            
           /*   NSMutableArray *myArrayOPhones = [exhibitorDict objectForKey:@"phones"];
             for (int b=1; b<[myArrayOPhones count]; b++) {
             NSMutableDictionary *myphonesDict =[myArrayOPhones objectAtIndex:b];
             [exhibitor setPhones:[myphonesDict objectForKey:@"phones"]];
             NSLog(@"my phones are:");
             NSLog([exhibitor phones]);
             }
            */
            
            NSMutableArray *myarrayofmobiles = [exhibitorDict objectForKey:@"mobiles"];
            for (int m=1; m<[myarrayofmobiles count]; m++) {
                NSMutableDictionary *mymobilesDict =[myarrayofmobiles objectAtIndex:m];
                [exhibitor setMobiles:[mymobilesDict objectForKey:@"mobiles"]];
                NSLog(@"mobiles are:");
                NSLog([exhibitor mobiles]);
            }
            
            [_exhibitor addObject:exhibitor];
        }
        
        [_netDelegate handle: mydic];
    }
     
     
     
failure:^(AFHTTPRequestOperation *myoperation, NSError *error) {
UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error retreiving data" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
[alert show];
    }];
    
    [myoperation start];
    return mydic;
}



@end
