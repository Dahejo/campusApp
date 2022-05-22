//
//  TimetableViewController.swift
//  campusApp
//
//  Created by Joeun Park on 5/2/22.
//

import UIKit
import Elliotable

class TimetableViewController: UIViewController, ElliotableDelegate, ElliotableDataSource {
    
    let course_1 = ElliottEvent(courseId: "c0001", courseName: "Operating System", roomName: "IT Building 21204", professor: "TEST", courseDay: .tuesday, startTime: "12:00", endTime: "13:15", backgroundColor: UIColor.systemPink)

    let course_2 = ElliottEvent(courseId: "c0002", courseName: "Operating System", roomName: "IT Building 21204", professor: "TEST", courseDay: .thursday, startTime: "12:00", endTime: "13:15", textColor: UIColor.white, backgroundColor: UIColor.systemPink)
    
    private let daySymbol = ["Mon", "Tue", "Wed", "Thu", "Fri"]
    
    @IBOutlet var elliotable: Elliotable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Delegate Pattern
        elliotable.delegate = self
        elliotable.dataSource = self
        
        // Table Item Properties
        elliotable.elliotBackgroundColor = UIColor.white
        elliotable.borderWidth        = 1
        elliotable.borderColor        = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)

        // Course Item Properties
        elliotable.textEdgeInsets = UIEdgeInsets(top: 2, left: 3, bottom: 2, right: 10)
        elliotable.courseItemMaxNameLength = 18
        elliotable.courseItemTextSize      = 12.5
        elliotable.courseTextAlignment     = .left
        // 시간표 강의 아이템 라운드
        elliotable.borderCornerRadius = 24
        elliotable.roomNameFontSize        = 8

        // courseItemHeight - default : 60.0
        elliotable.courseItemHeight       = 70.0

        // Day Symbol & Leftside Time Symbol Properties
        elliotable.symbolFontSize = 14
        elliotable.symbolTimeFontSize = 12
        elliotable.symbolFontColor = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
        elliotable.symbolTimeFontColor = UIColor(displayP3Red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        elliotable.symbolBackgroundColor = UIColor(named: "main_bg") ?? .white

        // Do any additional setup after loading the view.
    }
    
    func elliotable(elliotable: Elliotable, didSelectCourse selectedCourse: ElliottEvent) {
        
    }
    
    func elliotable(elliotable: Elliotable, didLongSelectCourse longSelectedCourse: ElliottEvent) {
        
    }
    
    func elliotable(elliotable: Elliotable, at dayPerIndex: Int) -> String {
        self.daySymbol[dayPerIndex]
    }
    
    func numberOfDays(in elliotable: Elliotable) -> Int {
        self.daySymbol.count
    }
    
    func courseItems(in elliotable: Elliotable) -> [ElliottEvent] {
        return [course_1, course_2]
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
