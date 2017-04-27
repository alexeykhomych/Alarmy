//
//  SoundListViewController.swift
//  Alarmy
//
//  Created by Alexey Khomych on 4/27/17.
//  Copyright © 2017 Alexey Khomych. All rights reserved.
//

import UIKit
import IDPRootViewGettable
import AudioToolbox

class SoundListViewController: UIViewController, RootViewGettable, UITableViewDataSource, UITableViewDelegate {
    
    typealias RootViewType = SoundListView
    
    private var soundList: [String] = []
    private let soundDirectory = "/System/Library/Audio/UISounds"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView?.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "reuseId")
        
        self.soundList = FileManager.default.enumerator(atPath: self.soundDirectory)!.map {
            String(describing: $0)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.soundList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseId", for: indexPath)
        let soundFileName = soundList[indexPath.row]
        let fullyQualifiedName = soundDirectory + "/" + soundFileName
        let url = URL(fileURLWithPath: fullyQualifiedName)
        
        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        cell.textLabel?.text = "\(soundFileName) \(soundId)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let soundFileName = soundList[indexPath.row]
        let fullyQualifiedName = soundDirectory + "/" + soundFileName
        let url = URL(fileURLWithPath: fullyQualifiedName)
        var soundId: SystemSoundID = 0
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        AudioServicesPlaySystemSound(soundId)
    }
}
