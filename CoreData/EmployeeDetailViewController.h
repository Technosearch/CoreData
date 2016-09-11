//
//  EmployeeDetailViewController.h
//  CoreData
//
//  Created by Aakash Gupta on 11/09/16.
//  Copyright © 2016 Technosearch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface EmployeeDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *designationTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;
@property (strong) NSManagedObject *employee;
- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;
@end
