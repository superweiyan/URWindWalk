//
//  URWWCalendarCollectionViewCell.h
//  URWindWalk
//
//  Created by weiyan on 25/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, URShowType){
    URShowTypeText = 0,
    URShowTypeImage = 1,
    UIShowTypeActive = 2
};

@protocol URWWCalendarCollectionViewCellDelegate <NSObject>

- (void)onCellClicked;

@end

@interface URWWCalendarCollectionViewCell : UICollectionViewCell

@property (nonatomic, assign) id<URWWCalendarCollectionViewCellDelegate> delegate;

//- (void)setType:(URShowType)type;

- (void)updateInfo:(NSUInteger)info;

@end
