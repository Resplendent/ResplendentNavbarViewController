//
//  RNBVCNavbarViewController.m
//  ResplendentNavbarViewController
//
//  Created by Benjamin Maer on 2/28/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import "RNBVCNavbarViewController.h"
#import "RNBVCNavbar.h"
#import "RUConstants.h"
#import "RUProtocolOrNil.h"





@interface RNBVCNavbarViewController ()

@property (nonatomic, readonly) Class _navbarClass;
@property (nonatomic, readonly) Class defaultNavbarClass;

@property (nonatomic, readonly) CGRect navbarFrame;

@end





@implementation RNBVCNavbarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _navbar = [self._navbarClass new];
    [self.view addSubview:_navbar];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [_navbar.superview bringSubviewToFront:_navbar];
    [_navbar setFrame:self.navbarFrame];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - Getters
-(Class)_navbarClass
{
    Class navbarClass = self.navbarClass;
    Class defaultNavbarClass = self.defaultNavbarClass;
    
    if (navbarClass != defaultNavbarClass &&
        ![navbarClass isSubclassOfClass:defaultNavbarClass])
    {
//        [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"navbar class %@ must be kind of class %@",navbarClass,defaultNavbarClass] userInfo:nil];
        [NSException exceptionWithName:NSInternalInconsistencyException reason:RUStringWithFormat(@"navbar class %@ must be kind of class %@",navbarClass,defaultNavbarClass) userInfo:nil];
    }
    
    return navbarClass;
}

-(Class)defaultNavbarClass
{
    return [RNBVCNavbar class];
}

#pragma mark - RTNavbarClassGetter
-(Class)navbarClass
{
    if (kRUProtocolOrNil(self.navigationController, RNBVCNavbarClassGetter))
    {
        return [kRUProtocolOrNil(self.navigationController, RNBVCNavbarClassGetter) navbarClass];
    }
    else
    {
        return self.defaultNavbarClass;
    }
}

#pragma mark - Frames
-(CGRect)navbarFrame
{
    CGSize size = [_navbar sizeThatFits:self.view.bounds.size];
    return (CGRect){0,0,size};
}

-(CGRect)contentFrame
{
    CGFloat yCoord = CGRectGetHeight(self.navbarFrame);
    return (CGRect){0,yCoord,CGRectGetWidth(self.view.bounds),CGRectGetHeight(self.view.bounds) - yCoord};
}

@end
