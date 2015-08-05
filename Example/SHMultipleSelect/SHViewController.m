//
//  SHViewController.m
//  SHMultipleSelect
//
//  Created by Shamsiddin Saidov on 07/22/2015.
//  Copyright (c) 2015 shamsiddin.saidov@gmail.com. All rights reserved.
//

#import "SHViewController.h"

@interface SHViewController ()
{
    IBOutlet UISwitch *_done;
    IBOutlet UISwitch *_cancel;
    IBOutlet UISwitch *_enableDone;
}
@end

@implementation SHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _dataSource = [[NSMutableArray alloc] initWithObjects:
                   @"James", @"Robert", @"Michael", @"William", @"David", @"Richard",
                   @"Pino", @"Lolly", @"Pop", @"Alberto", @"Pina", @"Gina", @"Mina", @"Lina",
                   nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchChanged:(UISwitch*)sender
{
    if ( sender.tag > 1 ) return;

    if ( sender.tag == 0 && !_cancel.isOn )
        [_cancel setOn:YES];

    if ( sender.tag == 1 && !_done.isOn )
        [_done setOn:YES];
}

- (IBAction)btnClick1
{
    SHMultipleSelect *multipleSelect = [[SHMultipleSelect alloc] init];
    multipleSelect.delegate = self;
    multipleSelect.rowsCount = _dataSource.count;
    multipleSelect.showCancelButton = _cancel.isOn;
    multipleSelect.showDoneButton = _done.isOn;
    multipleSelect.canCloseWithoutSelection = _enableDone.isOn;

    [multipleSelect show];
}
- (IBAction)btnClick2
{
    SHMultipleSelect *multipleSelect = [[SHMultipleSelect alloc] init];
    multipleSelect.delegate = self;
    multipleSelect.rowsCount = _dataSource.count;
    multipleSelect.showCancelButton = _cancel.isOn;
    multipleSelect.showDoneButton = _done.isOn;
    multipleSelect.canCloseWithoutSelection = _enableDone.isOn;

    [multipleSelect showWithHeader:@"Please select an option:"];
}
- (IBAction)btnClick3
{
    SHMultipleSelect *multipleSelect = [[SHMultipleSelect alloc] init];
    multipleSelect.delegate = self;
    multipleSelect.rowsCount = _dataSource.count;
    multipleSelect.showCancelButton = _cancel.isOn;
    multipleSelect.showDoneButton = _done.isOn;
    multipleSelect.canCloseWithoutSelection = _enableDone.isOn;

    [multipleSelect showWithHeader:@"Please select an option:" optionSingle:YES];
}


#pragma mark - SHMultipleSelectDelegate
- (void)multipleSelectView:(SHMultipleSelect*)multipleSelectView clickedBtnAtIndex:(NSInteger)clickedBtnIndex withSelectedIndexPaths:(NSArray *)selectedIndexPaths {
    if (clickedBtnIndex == 1) { // Done btn
        for (NSIndexPath *indexPath in selectedIndexPaths) {
            NSLog(@"%@", _dataSource[indexPath.row]);
        }
    }
}

- (NSString*)multipleSelectView:(SHMultipleSelect*)multipleSelectView titleForRowAtIndexPath:(NSIndexPath*)indexPath {
    return _dataSource[indexPath.row];
}

- (BOOL)multipleSelectView:(SHMultipleSelect*)multipleSelectView setSelectedForRowAtIndexPath:(NSIndexPath*)indexPath {
    return NO;

//    BOOL canSelect = NO;
//    if (indexPath.row == _dataSource.count - 1) { // last object
//        canSelect = YES;
//    }
//    return canSelect;
}


@end
