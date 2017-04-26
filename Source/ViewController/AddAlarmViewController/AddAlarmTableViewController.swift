//
//  AddAlarmTableViewController.swift
//  Alarmy
//
//  Created by Alexey Khomych on 4/26/17.
//  Copyright © 2017 Alexey Khomych. All rights reserved.
//

import UIKit
import IDPRootViewGettable

class AddAlarmTableViewController: UITableViewController, RootViewGettable {
    
    typealias RootViewType = AddAlarmView
    
    var model: Alarm?
    var q = ["", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Добавить"
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var alarm1 = Alarm()
        
        alarm1.time = "08:00"
        alarm1.days = "Monday"
        alarm1.interval = 5
        alarm1.signalPath = "Good Morning"
        
        self.model = alarm1
        
        let timeCell = TimeTableViewCell.self
        let replayCell = ReplayTableViewCell.self
        let soundCell = SoundTableViewCell.self
        let replaySoundCell = ReplaySoundTableViewCell.self
        self.tableView?.register(UINib.nibWithClass(timeCell),
                                           forCellReuseIdentifier: String(describing: timeCell.self))
        self.tableView?.register(UINib.nibWithClass(replayCell),
                                 forCellReuseIdentifier: String(describing: replayCell.self))
        self.tableView?.register(UINib.nibWithClass(soundCell),
                                 forCellReuseIdentifier: String(describing: soundCell.self))
        self.tableView?.register(UINib.nibWithClass(replaySoundCell),
                                 forCellReuseIdentifier: String(describing: replaySoundCell.self))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var identifier = ""
        
        let row = indexPath.row
        
        if row == 0 {
            identifier = String(describing: TimeTableViewCell.self)
        } else if row == 1 {
            identifier = String(describing: ReplayTableViewCell.self)
        } else if row == 2 {
            identifier = String(describing: SoundTableViewCell.self)
        } else if row == 3 {
            identifier = String(describing: ReplaySoundTableViewCell.self)
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        
        return cell!
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.q.count
    }
}
