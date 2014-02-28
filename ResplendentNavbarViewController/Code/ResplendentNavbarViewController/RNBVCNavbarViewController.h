//
//  RNBVCNavbarViewController.h
//  ResplendentNavbarViewController
//
//  Created by Benjamin Maer on 2/28/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RNBVCNavbarClassGetter.h"





@class RNBVCNavbar;





@interface RNBVCNavbarViewController : UIViewController <RNBVCNavbarClassGetter>

@property (nonatomic, readonly) RNBVCNavbar* navbar;
@property (nonatomic, readonly) CGRect contentFrame;

@end
