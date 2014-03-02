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

@property (nonatomic, readonly) UILabel* titleLabel;
@property (nonatomic, readonly) Class titleLabelClass;

@property (nonatomic, strong) UIButton* leftButton;
@property (nonatomic, assign) CGRect leftButtonFrame;

@property (nonatomic, strong) UIButton* rightButton;
@property (nonatomic, assign) CGRect rightButtonFrame;

@property (nonatomic, readonly) CGRect contentViewFrame;
@property (nonatomic, readonly) CGFloat contentViewFrameBottomPadding;

@property (nonatomic, readonly) CGFloat height; //For overloading

@end
