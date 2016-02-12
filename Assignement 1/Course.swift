//
//  Course.swift
//  Assignement 1
//
//  Created by Ayesha on 2/10/16.
//  Copyright © 2016 Ayesha. All rights reserved.
//

import Foundation

class Course{
    var courseTitle: String?
    var grade: Double?
    var numberOfCredits: Int?
    var assignments: Assessment?
    var midterm: Assessment?
    var final: Assessment?
    
    func finalizeGrade() {
        
        let assignmentFinal = assignments!.point! / assignments!.max! * assignments!.percent!
        let midtermFinal = midterm!.point! / midterm!.max! * midterm!.percent!
        let finalFinal = final!.point! / final!.max! * final!.percent!
        let totalScore =  assignmentFinal + midtermFinal + finalFinal
        
        grade = totalScore
    }

}