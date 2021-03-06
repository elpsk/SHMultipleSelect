//
//  SHMultipleSelect.h
//  Bugzilla
//
//  Created by Shamsiddin Saidov on 07/22/2015.
//  Copyright (c) 2015 shamsiddin.saidov@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+SHAdditions.h"
#import "UIImage+SHAdditions.h"


@class SHMultipleSelect;
@protocol SHMultipleSelectDelegate <NSObject>

@optional
- (void)multipleSelectView:(SHMultipleSelect*)multipleSelectView clickedBtnAtIndex:(NSInteger)clickedBtnIndex withSelectedIndexPaths:(NSArray*)selectedIndexPaths;
- (NSString*)multipleSelectView:(SHMultipleSelect*)multipleSelectView titleForRowAtIndexPath:(NSIndexPath*)indexPath;
- (BOOL)multipleSelectView:(SHMultipleSelect*)multipleSelectView setSelectedForRowAtIndexPath:(NSIndexPath*)indexPath;
@end


@interface SHMultipleSelect : UIView<UITableViewDataSource, UITableViewDelegate> {
    UITableView* _table;
    UIScrollView* _tableScroll;
    UIButton* _cancelBtn;
    UIButton* _doneBtn;
    UIView* _btnsSeparator;
    UIView* _coverView;
    UIView* _headerView;
    UILabel* _headerLabelView;

    BOOL _showHeader;
    BOOL _singleOption;
}

@property (nonatomic, assign) id<SHMultipleSelectDelegate> delegate;
@property (nonatomic, assign) NSInteger rowsCount;

@property (nonatomic, assign) BOOL canCloseWithoutSelection;
@property (nonatomic, assign) BOOL showCancelButton;
@property (nonatomic, assign) BOOL showDoneButton;

- (void)show;
- (void)showWithHeader:(NSString*)pHeader;
- (void)showWithHeader:(NSString*)pHeader optionSingle:(BOOL)pSingle;

@end
