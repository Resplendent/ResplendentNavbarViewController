//
//  RNBVCNavbar.m
//  ResplendentNavbarViewController
//
//  Created by Benjamin Maer on 2/28/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import "RNBVCNavbar.h"





@interface RNBVCNavbar ()

@property (nonatomic, readonly) CGFloat contentViewFrameUpperPadding;
@property (nonatomic, readonly) CGRect leftButtonFrame;
@property (nonatomic, readonly) CGRect rightButtonFrame;
@property (nonatomic, readonly) CGRect titleLabelFrame;

@end





@implementation RNBVCNavbar

@synthesize titleLabel = _titleLabel;

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        _contentView = [UIView new];
        [self addSubview:_contentView];
    }
    
    return self;
}

-(CGSize)sizeThatFits:(CGSize)size
{
    return (CGSize){size.width,self.height};
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [_contentView setFrame:self.contentViewFrame];
    [_leftButton setFrame:self.leftButtonFrame];
    [_rightButton setFrame:self.rightButtonFrame];

    if (_titleLabel)
    {
        [_titleLabel setFrame:self.titleLabelFrame];
    }
}

#pragma mark - Setters
-(void)setLeftButton:(UIButton *)leftButton
{
    if (self.leftButton == leftButton)
        return;
    
    if (self.leftButton)
    {
        [self.leftButton removeFromSuperview];
    }
    
    _leftButton = leftButton;
    
    if (self.leftButton)
    {
        [_contentView addSubview:self.leftButton];
        [self setNeedsLayout];
    }
}

-(void)setRightButton:(UIButton *)rightButton
{
    if (self.rightButton == rightButton)
        return;
    
    if (self.rightButton)
    {
        [self.rightButton removeFromSuperview];
    }
    
    _rightButton = rightButton;
    
    if (self.rightButton)
    {
        [_contentView addSubview:self.rightButton];
        [self setNeedsLayout];
    }
}

#pragma mark - Getters
-(UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [UILabel new];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setUserInteractionEnabled:NO];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_contentView addSubview:_titleLabel];
    }

    return _titleLabel;
}

-(CGFloat)height
{
    return 44.0f + self.contentViewFrameUpperPadding;
}

#pragma mark - Frames
-(CGFloat)contentViewFrameUpperPadding
{
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)
    {
        return CGRectGetHeight([UIApplication sharedApplication].statusBarFrame);
    }
    
    return 0.0f;
}

-(CGRect)contentViewFrame
{
    CGFloat contentViewFrameUpperPadding = self.contentViewFrameUpperPadding;
    
    return (CGRect){0,contentViewFrameUpperPadding,CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds) - contentViewFrameUpperPadding};
}

-(CGRect)leftButtonFrame
{
    CGFloat height = CGRectGetHeight(self.contentViewFrame);
    return (CGRect){0,0,height,height};
}

-(CGRect)rightButtonFrame
{
    CGRect contentViewFrame = self.contentViewFrame;
    CGFloat height = CGRectGetHeight(contentViewFrame);
    return (CGRect){CGRectGetWidth(contentViewFrame) - height,0,height,height};
}

-(CGRect)titleLabelFrame
{
    return (CGRect){0,0,self.contentViewFrame.size};
}

@end
