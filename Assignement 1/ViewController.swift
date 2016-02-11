//
//  ViewController.swift
//  Assignement 1
//
//  Created by Ayesha on 2/8/16.
//  Copyright © 2016 Ayesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var courseTitleTextField: UITextField!
    @IBOutlet weak var assignmentsPointTextField: UITextField!
    @IBOutlet weak var assignmentsMaxTextField: UITextField!
    @IBOutlet weak var assignmentsPercentTextField: UITextField!
    @IBOutlet weak var midtermPointTextField: UITextField!
    @IBOutlet weak var midtermMaxTextField: UITextField!
    @IBOutlet weak var midtermPercentTextField: UITextField!
    @IBOutlet weak var finalPointTextField: UITextField!
    @IBOutlet weak var finalMaxTextField: UITextField!
    @IBOutlet weak var finalPercentTextField: UITextField!
    @IBOutlet weak var creditAmountTextField: UITextField!
    @IBOutlet weak var deleteCourseNumberTextField: UITextField!
    @IBOutlet weak var courseOneLabel: UILabel!
    @IBOutlet weak var courseTwoLabel: UILabel!
    @IBOutlet weak var courseThreeLabel: UILabel!
    @IBOutlet weak var courseFourLabel: UILabel!
    @IBOutlet weak var courseOneGradeImageView: UIImageView!
    @IBOutlet weak var courseTwoGradeImageView: UIImageView!
    @IBOutlet weak var courseThreeGradeImageView: UIImageView!
    @IBOutlet weak var courseFourGradeImageView: UIImageView!
    @IBOutlet weak var deleteCourseButton: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func addCoursePress(sender: AnyObject) {
        print("Hello")
        let course = Course()
        let assignment = Assessment()
        let midterm = Assessment()
        let final = Assessment()
        
        if courseTitleTextField.text == nil{
            print("Enter a course name to continue")
            return
        }
        course.courseTitle = courseTitleTextField.text
        course.numberOfCredits = Int(creditAmountTextField.text!)
        
        assignment.point = Int(assignmentsPointTextField.text!)
        assignment.max = Int(assignmentsMaxTextField.text!)
        assignment.percent = Int(assignmentsPercentTextField.text!)
        
        midterm.point = Int(midtermPointTextField.text!)
        midterm.max = Int(midtermMaxTextField.text!)
        midterm.percent = Int(midtermPercentTextField.text!)
        
        final.point = Int(finalPointTextField.text!)
        final.max = Int(finalMaxTextField.text!)
        final.percent = Int(finalPercentTextField.text!)
        
        course.assignments = assignment
        course.midterm = midterm
        course.final = final
        
        
        
        
    }
    
    @IBAction func deleteCoursePressed(sender: AnyObject) {
    
        
    }

}

