//
//  YJUITableViewCell.m
//  YJUITableViewFactory
//
//  HomePage:https://github.com/937447974/YJCocoa
//  YJ技术支持群:557445088
//
//  Created by 阳君 on 16/5/21.
//  Copyright © 2016年 YJCocoa. All rights reserved.
//

#import "YJUITableViewCell.h"
#import "YJUITableViewManager.h"
#import "YJNSFoundationOther.h"

#pragma mark - UIView (YJUITableView)
@implementation UIView (YJUITableView)

+ (YJUITableViewCellCreate)cellCreate {
    [self doesNotRecognizeSelector:_cmd];
    return YJUITableViewCellCreateClass;
}

+ (YJUITableCellObject *)cellObject {
    YJUITableCellObject *cellObject = [[YJUITableCellObject alloc] initWithTableViewCellClass:self.class];
    cellObject.createCell = self.cellCreate;
    return cellObject;
}

+ (YJUITableCellObject *)cellObjectWithCellModel:(id<YJUITableCellModelProtocol>)cellModel {
    YJUITableCellObject *cellObject = [self cellObject];
    cellObject.cellModel = cellModel;
    return cellObject;
}

- (void)reloadDataWithCellObject:(YJUITableCellObject *)cellObject tableViewManager:(YJUITableViewManager *)tableViewManager {
    [self doesNotRecognizeSelector:_cmd];
}

@end

#pragma mark - UITableViewCell (YJUITableView)
@implementation UITableViewCell (YJUITableView)

+ (CGFloat)tableViewManager:(YJUITableViewManager *)tableViewManager heightForCellObject:(YJUITableCellObject *)cellObject {
    switch (cellObject.createCell) {
        case YJUITableViewCellCreateClass:
            return tableViewManager.tableView.rowHeight;
        case YJUITableViewCellCreateXib: {
            NSArray<UITableView *> *array = [[NSBundle mainBundle] loadNibNamed:cellObject.cellName owner:nil options:nil];
            return CGRectGetHeight(array.firstObject.frame);
        }
        case YJUITableViewCellCreateSoryboard: {
            UITableViewCell *cell = [tableViewManager.tableView dequeueReusableCellWithIdentifier:cellObject.cellName];
            return CGRectGetHeight(cell.frame);
        }
    }
}

@end


#pragma mark - YJUITableViewCell
@implementation YJUITableViewCell

#pragma mark - init
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 80%以上的业务都不会需要点击效果，故屏蔽
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

#pragma mark - getter & setter
- (NSString *)reuseIdentifier {
    NSString *reuseIdentifier = [super reuseIdentifier];
    if (reuseIdentifier) return reuseIdentifier;
    return YJNSStringFromClass(self.class);
}

#pragma mark - YJUITableView
+ (YJUITableViewCellCreate)cellCreate {
    if ([YJNSStringFromClass([YJUITableViewCell class]) isEqualToString:YJNSStringFromClass(self.class)]) {
        return YJUITableViewCellCreateClass;
    }
    return [super cellCreate];
}

- (void)reloadDataWithCellObject:(YJUITableCellObject *)cellObject tableViewManager:(YJUITableViewManager *)tableViewManager {
    _cellObject = cellObject;
    _tableViewManager = tableViewManager;
}

@end
