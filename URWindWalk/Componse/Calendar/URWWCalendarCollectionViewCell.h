//
//  URWWCalendarCollectionViewCell.h
//  URWindWalk
//
//  Created by weiyan on 25/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol URWWCalendarCollectionViewCellDelegate <NSObject>

- (void)onCellClicked;

@end

@interface URWWCalendarCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) id<URWWCalendarCollectionViewCellDelegate> delegate;

- (void)updateInfo:(NSString *)info;

@end
