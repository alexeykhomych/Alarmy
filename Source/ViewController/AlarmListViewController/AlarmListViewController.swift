//
//  AlarmListViewController.swift
//  Alarmy
//
//  Created by Alexey Khomych on 4/25/17.
//  Copyright © 2017 Alexey Khomych. All rights reserved.
//

import UIKit
import IDPRootViewGettable

class AlarmListViewController: UIViewController, RootViewGettable, UITableViewDelegate, UITableViewDataSource {
    
    typealias RootViewType = AlarmListView
    
    var alarms: [Alarm] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        var alarm1 = Alarm()
        var alarm2 = Alarm()
        var alarm3 = Alarm()
        
        alarm1.time = "08:00"
        alarm1.days = "Monday"
        alarm1.interval = 5
        alarm1.signalPath = "Good Morning"
        
        alarm2.time = "21:00"
        alarm2.days = "Friday"
        alarm2.interval = 5
        alarm2.signalPath = "Vocal"
        
        alarm3.time = "12:00"
        alarm3.days = "Monday, Friday, Saturday"
        alarm3.interval = 7
        alarm3.signalPath = "Paradise"
        
        self.alarms.append(alarm1)
        self.alarms.append(alarm2)
        self.alarms.append(alarm3)
        
        let cell = AlarmListTableViewCell.self
        self.rootView?.tableView?.register(UINib.nibWithClass(cell),
                                           forCellReuseIdentifier: String(describing: cell.self))
        
        self.navigationItem.title = "Будильник"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:AlarmListTableViewCell = tableView.dequeueReusableCell(withIdentifier: String(describing: AlarmListTableViewCell.self)) as! AlarmListTableViewCell
        
        cell.fill(self.alarms[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = AddAlarmTableViewController()
        controller.model = self.alarms[indexPath.row]
        _ = self.navigationController?.pushViewController(controller, animated: true)
    }
}

struct Alarm {
    var time: String?
    var days: String?
    var signalPath: String?
    var interval: Int?
}
