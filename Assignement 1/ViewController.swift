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
    @IBOutlet weak var gpaUILabel: UILabel!
    
    var courses = [Course]()//empty array
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        deleteCourseButton.enabled = false
        
        let dismissRecognizer = UITapGestureRecognizer()
        dismissRecognizer.addTarget(self, action: "hideKeyboard")
        view.addGestureRecognizer(dismissRecognizer)
    }
    
    func hideKeyboard() {
        view.endEditing(true)
    }

    @IBAction func addCoursePress(sender: AnyObject) {
        let course = Course()
        let assignment = Assessment()//empty assessment object (assignment)
        let midterm = Assessment()
        let final = Assessment()
        
        if courseTitleTextField.text == nil || courseTitleTextField.text == ""//alert to make sure there is a course title
        {
            alertForString("Enter a course name to continue.")
            return
        }
        
        if (courses.count >= 4) //alert if user attempts to add 5th class
        {
            alertForString("Cannot enter more than 4 courses.")
            return
        }

        course.courseTitle = courseTitleTextField.text
     
        for course in courses {
            if course.courseTitle == courseTitleTextField.text{ //alert if user tries to enter same class title twice
            alertForString("Enter a different class title.")
            return
            }
        }
        
        course.numberOfCredits = Int(creditAmountTextField.text!)
        
        assignment.point = Double(assignmentsPointTextField.text!)//gets data for assignments
        assignment.max = Double(assignmentsMaxTextField.text!)
        assignment.percent = Double(assignmentsPercentTextField.text!)
        if (assignment.point > assignment.max){ //alert if Assignment points are more than max points
            alertForString("Assignment points cannot exceed the max points.")
            return
        }
        
        midterm.point = Double(midtermPointTextField.text!)
        midterm.max = Double(midtermMaxTextField.text!)
        midterm.percent = Double(midtermPercentTextField.text!)
        if (midterm.point > midterm.max){ //alert if Midterm points are more than max points

            alertForString("Midterm points cannot exceed max points.")
            return
        }
        
        final.point = Double(finalPointTextField.text!)
        final.max = Double(finalMaxTextField.text!)
        final.percent = Double(finalPercentTextField.text!)
        if (final.point > final.max){//alert if Final points are more than max points
            alertForString("Final points cannot exceed max points.")
            return
        }
        
        if (assignment.percent! + midterm.percent! + final.percent! != 100){ //alert if percent total is less than 100%
            alertForString("Percent totals must equal 100.")
            return
        }
        
        course.assignments = assignment //gives assignment data to course
        course.midterm = midterm
        course.final = final
        
        course.finalizeGrade()
        print(course.grade)
        courses.append(course)
        courseDisplay()
        
    }
    
    @IBAction func deleteCoursePressed(sender: AnyObject) {
        let deleteCourseNumber = Int(deleteCourseNumberTextField.text!)
        if (deleteCourseNumber > courses.count) || deleteCourseNumber < 1 || deleteCourseNumber == nil {
            alertForString("Course id not found")//alert if user tries to delete a course that does not exist
            return
        }
        courses.removeAtIndex(deleteCourseNumber! - 1)
        courseDisplay()
    }
    
    func courseDisplay(){
        if courses.isEmpty {
            deleteCourseButton.enabled = false
        } else {
            deleteCourseButton.enabled = true
        }
        
        
        courseOneLabel.text = ""
        courseOneGradeImageView.image = nil
        courseTwoLabel.text = ""
        courseTwoGradeImageView.image = nil
        courseThreeLabel.text = ""
        courseThreeGradeImageView.image = nil
        courseFourLabel.text = ""
        courseFourGradeImageView.image = nil
        
        for (index, course) in courses.enumerate() {
            switch index {
            case 0:
                courseOneLabel.text = "1) \(course.courseTitle!) | \(course.numberOfCredits!)"
                if course.grade >= 90{
                    courseOneGradeImageView.image = UIImage(named: "grade_a")
                    course.gradeInScale = 4
                } else if course.grade >= 80 {
                    courseOneGradeImageView.image = UIImage(named: "grade_b")
                    course.gradeInScale = 3
                } else if course.grade >= 70 {
                    courseOneGradeImageView.image = UIImage(named: "grade_c")
                    course.gradeInScale = 2
                } else if course.grade >= 60 {
                    courseOneGradeImageView.image = UIImage(named: "grade_d")
                    course.gradeInScale = 1
                } else if course.grade < 60 {
                    courseOneGradeImageView.image = UIImage(named: "grade_f")
                    course.gradeInScale = 0
                }
                break
            case 1:
                courseTwoLabel.text = "2) \(course.courseTitle!) | \(course.numberOfCredits!)"
                if course.grade >= 90{
                    courseTwoGradeImageView.image = UIImage(named: "grade_a")
                    course.gradeInScale = 4
                } else if course.grade >= 80 {
                    courseTwoGradeImageView.image = UIImage(named: "grade_b")
                    course.gradeInScale = 3
                } else if course.grade >= 70 {
                    courseTwoGradeImageView.image = UIImage(named: "grade_c")
                    course.gradeInScale = 2
                } else if course.grade >= 60 {
                    courseTwoGradeImageView.image = UIImage(named: "grade_d")
                    course.gradeInScale = 1
                } else if course.grade < 60 {
                    courseTwoGradeImageView.image = UIImage(named: "grade_f")
                    course.gradeInScale = 0
                }
                break
            case 2:
                courseThreeLabel.text = "3) \(course.courseTitle!) | \(course.numberOfCredits!)"
                if course.grade >= 90{
                    courseThreeGradeImageView.image = UIImage(named: "grade_a")
                    course.gradeInScale = 4
                } else if course.grade >= 80 {
                    courseThreeGradeImageView.image = UIImage(named: "grade_b")
                    course.gradeInScale = 3
                } else if course.grade >= 70 {
                    courseThreeGradeImageView.image = UIImage(named: "grade_c")
                    course.gradeInScale = 2
                } else if course.grade >= 60 {
                    courseThreeGradeImageView.image = UIImage(named: "grade_d")
                    course.gradeInScale = 1
                } else if course.grade < 60 {
                    courseThreeGradeImageView.image = UIImage(named: "grade_f")
                    course.gradeInScale = 0
                }
                break
            case 3:
                courseFourLabel.text = "4) \(course.courseTitle!) | \(course.numberOfCredits!)"
                if course.grade >= 90{
                    courseFourGradeImageView.image = UIImage(named: "grade_a")
                    course.gradeInScale = 4
                } else if course.grade >= 80 {
                    courseFourGradeImageView.image = UIImage(named: "grade_b")
                    course.gradeInScale = 3
                } else if course.grade >= 70 {
                    courseFourGradeImageView.image = UIImage(named: "grade_c")
                    course.gradeInScale = 2
                } else if course.grade >= 60 {
                    courseFourGradeImageView.image = UIImage(named: "grade_d")
                    course.gradeInScale = 1
                } else if course.grade < 60 {
                    courseFourGradeImageView.image = UIImage(named: "grade_f")
                    course.gradeInScale = 0
                }
                break
            default:
                //nothing
                break
            }
            course.gpaPoints()
        }
        
        displayGPA()
    }
    
    func displayGPA(){
        if courses.count < 1 {
            gpaUILabel.textColor = UIColor.whiteColor()
            gpaUILabel.text = "gpa:"
            return
        }
        var totalCredits = 0
        var totalPoints = 0.0
        
        for course in courses{
            totalPoints += course.points!
            totalCredits += course.numberOfCredits!
        }
    
        let gpa = totalPoints / (Double(totalCredits) * 4) * 4
        gpaUILabel.text = String(format: "gpa: %0.2f", gpa)
        
        
        if gpa >= 3.0 {
            gpaUILabel.textColor = UIColor.greenColor()
        }else if gpa >= 2.0 {
            gpaUILabel.textColor = UIColor.orangeColor()
        }else if gpa < 2.0 {
            gpaUILabel.textColor = UIColor.redColor()
        }
    }
    
    func alertForString(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
        alert.addAction(okAction)
        presentViewController(alert, animated: true, completion: nil)
    }

}

