//
//  ViewController.m
//  Tables
//
//  Created by Jared Taylor on 5/19/15.
//  Copyright (c) 2015 Jared Taylor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtStudentName;

@property NSArray* StudentNames;

@property (strong, nonatomic) IBOutlet UITableView *tblStudents;

@end

NSString* CELL_NAME= @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStudentNames: @[@"EJ", @"Liz", @"Jared", @"Misti", @"Ryan", @"Megan"]];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)txtAddNewStudent:(id)sender {
    NSString* name = [[self txtStudentName] text];
    // reads the information from the text box
    
    [self setStudentNames: [[self StudentNames] arrayByAddingObject: name]];
    // gets an array, adding it to the previous array, then replacing it with a new object
    
    [[self tblStudents] reloadData];
    // adds new text with each keystroke
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section{
    return [[self StudentNames] count];
}

-(UITableViewCell*) tableView: (UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CELL_NAME];
    // if no reusable cell exists, create a new one
    // nil means empty value
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CELL_NAME];
    }
    NSInteger currentRow = [indexPath row];
    NSString* currentStudent = [[self StudentNames] objectAtIndex: currentRow];
    [[cell textLabel] setText: currentStudent];
    return cell;
}

@end
