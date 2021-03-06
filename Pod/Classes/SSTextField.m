//
//  SSTextField.m
//  Pods
//
//  Created by Shwet Solanki on 18/09/15.
//
//

#import "SSTextField.h"
#import "UIView+Base.h"
#import "SSTheme.h"

@implementation SSTextField

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
    [self updateView];
}

-(void)prepareForInterfaceBuilder
{
    [super prepareForInterfaceBuilder];
    [self setup];
    [self updateView];
}

-(void)setup
{
    self.fontDictionary = [[SSTheme currentTheme] fontDictionary];
    self.colorDictionary = [[SSTheme currentTheme] colorDictionary];
}

-(void)updateView
{
    if(_fontKey)
    {
        NSAssert(self.fontDictionary[_fontKey], @"Invalid Font Key %@",_fontKey);
        [self setFont:self.fontDictionary[_fontKey]];
    }
    
    if(_colorKey)
    {
        NSAssert(self.colorDictionary[_colorKey], @"Invalid Color Key %@",_colorKey);
        [self setTextColor:self.colorDictionary[_colorKey]];
    }
    
    if(self.placeholder)
    {
        UIColor * placeHolderColor = [self.textColor colorWithAlphaComponent:0.5];
        if(self.placeHolderColorKey)
            placeHolderColor = self.colorDictionary[_placeHolderColorKey];
        [self setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName : placeHolderColor}]];
    }
    
    [self.layer setCornerRadius:_cornerRadius];
    
    [self addBorder:_borderWidth color:_borderColorKey colorDict:self.colorDictionary];
}

- (CGRect)borderRectForBounds:(CGRect)bounds
{
    if(!CGPointEqualToPoint(_padding, CGPointZero))
        return CGRectInset(bounds, _padding.x, _padding.y);
    else
        return [super borderRectForBounds:bounds];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
    if(!CGPointEqualToPoint(_padding, CGPointZero))
        return CGRectInset(bounds, _padding.x, _padding.y);
    else
        return [super textRectForBounds:bounds];
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds
{
    if(!CGPointEqualToPoint(_padding, CGPointZero))
        return CGRectInset(bounds, _padding.x, _padding.y);
    else
        return [super placeholderRectForBounds:bounds];
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    if(!CGPointEqualToPoint(_padding, CGPointZero))
        return CGRectInset(bounds, _padding.x, _padding.y);
    else
        return [super editingRectForBounds:bounds];
}


@end
