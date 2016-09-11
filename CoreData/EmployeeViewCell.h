//
//  EmployeeViewCell.h
//  CoreData
//
//  Created by Aakash Gupta on 11/09/16.
//  Copyright © 2016 Technosearch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmployeeViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameField;
@property (weak, nonatomic) IBOutlet UILabel *designationField;
@property (weak, nonatomic) IBOutlet UILabel *salaryField;

@end
