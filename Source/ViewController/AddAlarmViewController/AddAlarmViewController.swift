//
//  AddAlarmViewController.swift
//  Alarmy
//
//  Created by Alexey Khomych on 4/25/17.
//  Copyright © 2017 Alexey Khomych. All rights reserved.
//

import UIKit
import IDPRootViewGettable

class AddAlarmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RootViewGettable {
    
    typealias RootViewType = AddAlarmView
    
    var model: Alarm?
    var q = ["", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepareTableView()
        self.prepareNavigationBar()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        if row == 2 {
            self.navigationController?.pushViewController(SoundListViewController(), animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.q.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = indexPath.row
        
        if row == 0 {
            return 211
        }
        
        return 44
    }
    
    // MARK: - Private methods
    
    private func prepareTableView() {
        let timeCell = TimeTableViewCell.self
        let replayCell = ReplayTableViewCell.self
        let soundCell = SoundTableViewCell.self
        let replaySoundCell = ReplaySoundTableViewCell.self
        
        let tableView = self.rootView?.tableView
        tableView?.register(UINib.nibWithClass(timeCell),
                            forCellReuseIdentifier: String(describing: timeCell.self))
        tableView?.register(UINib.nibWithClass(replayCell),
                            forCellReuseIdentifier: String(describing: replayCell.self))
        tableView?.register(UINib.nibWithClass(soundCell),
                            forCellReuseIdentifier: String(describing: soundCell.self))
        tableView?.register(UINib.nibWithClass(replaySoundCell),
                            forCellReuseIdentifier: String(describing: replaySoundCell.self))
    }
    
    private func prepareNavigationBar() {
        let item = self.navigationItem
        if self.model != nil {
            item.title = "Изменить"
        } else {
            item.title = "Добавить"
        }
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAlarm))
        item.setRightBarButton(addButton, animated: true)
    }
    
    @objc private func addAlarm() {
        _ = self.navigationController?.popViewController(animated: true)
    }
}
