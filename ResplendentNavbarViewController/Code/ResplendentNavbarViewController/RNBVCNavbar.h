//
//  RNBVCNavbar.h
//  ResplendentNavbarViewController
//
//  Created by Benjamin Maer on 2/28/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import <UIKit/UIKit.h>





@interface RNBVCNavbar : UIView
{
    UIView* _contentView;
}

@property (nonatomic, strong) UIButton* leftButton;
@property (nonatomic, strong) UIButton* rightButton;

@property (nonatomic, readonly) CGRect contentViewFrame;

@property (nonatomic, readonly) CGFloat height; //For overloading

@end
