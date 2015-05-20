//
//  ViewController.m
//  Tables
//
//  Created by Jared Taylor on 5/19/15.
//  Copyright (c) 2015 Jared Taylor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSArray* StudentNames;
@end

NSString* CELL_NAME= @"Cell";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setStudentNames: @[@"EJ", @"Liz", @"Jared", @"Misti", @"Ryan", @"Megan"]];
    // Do any additional setup after loading the view, typically from a nib.
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
