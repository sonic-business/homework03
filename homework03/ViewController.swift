//
//  ViewController.swift
//  homework03
//
//  Created by student on 2020/11/27.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var calculatorLabel: UILabel!
    @IBOutlet weak var firstDatePicker: UIDatePicker!
    @IBOutlet weak var secondDatePicker: UIDatePicker!

    let dateFormat: String = "yyyy / MM / dd / EEEE"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let today = Date()
        let todayDate = dateConvertString(date: today, format: dateFormat)
        todayLabel.text = "[Today]  \(todayDate)"
        dateCalculator()
    }

    func dateConvertString(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
    }

    func stringConvertDate(date: String, format: String) -> Date {
        let dateformat = DateFormatter.init()
        dateformat.dateFormat = format
        return dateformat.date(from: date) ?? Date()
    }

    func dateCalculator() -> () {
        let topString = dateConvertString(date: firstDatePicker.date, format: dateFormat)
        let bottomString = dateConvertString(date: secondDatePicker.date, format: dateFormat)

        let startDate = stringConvertDate(date: topString, format: dateFormat)
        let endDate = stringConvertDate(date: bottomString, format: dateFormat)
        let calendar = Calendar.current
        let diff = calendar.dateComponents([.day], from: startDate, to: endDate)
        let centerString = "兩者相差 \(diff.day!) 天"

        calculatorLabel.text = "\(topString)\n\n\(centerString)\n\n\(bottomString)"
    }

    @IBAction func datepickerChanged(_ sender: Any) {
        dateCalculator()
    }


}

