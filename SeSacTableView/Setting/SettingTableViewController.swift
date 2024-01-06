//
//  SettingTableViewController.swift
//  SeSacTableView
//
//  Created by hwijinjeong on 1/7/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    var titles = ["공지사항", "실험실", "버전 정보"]
    var titles2 = ["개인/보안", "알림", "채팅", "멀티프로필"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 4
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = titles[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = titles2[indexPath.row]
        } else {
            cell.textLabel?.text = "고객센터/도움말"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        40
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else {
            return "기타"
        }
    }
   

}
