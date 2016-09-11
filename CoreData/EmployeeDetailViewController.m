//
//  EmployeeDetailViewController.m
//  CoreData
//
//  Created by Aakash Gupta on 11/09/16.
//  Copyright © 2016 Technosearch. All rights reserved.
//

#import "EmployeeDetailViewController.h"

@interface EmployeeDetailViewController ()

@end

@implementation EmployeeDetailViewController
@synthesize employee;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.employee) {
        [self.nameTextField setText:[self.employee valueForKey:@"name"]];
        [self.designationTextField setText:[self.employee valueForKey:@"designation"]];
        [self.salaryTextField setText:[self.employee valueForKey:@"salary"]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.employee) {
        // Update existing device
        [self.employee setValue:self.nameTextField.text forKey:@"name"];
        [self.employee setValue:self.designationTextField.text forKey:@"designation"];
        [self.employee setValue:self.salaryTextField.text forKey:@"salary"];
        
    } else {
        // Create a new device
        NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
        [newDevice setValue:self.nameTextField.text forKey:@"name"];
        [newDevice setValue:self.designationTextField.text forKey:@"designation"];
        [newDevice setValue:self.salaryTextField.text forKey:@"salary"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end