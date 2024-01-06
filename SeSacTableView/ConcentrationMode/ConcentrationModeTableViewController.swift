//
//  ConcentrationModeTableViewController.swift
//  SeSacTableView
//
//  Created by hwijinjeong on 1/6/24.
//

import UIKit

class ConcentrationModeTableViewController: UITableViewController {
    var list = ["방해 금지 모드", "수면", "업무", "개인 시간"]
    var detailList = ["켬", nil, nil, "설정"]
    var images = ["moon.fill", "bed.double.fill", "bag.fill", "person.fill"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "concentrationCell")!
        
        if indexPath.section == 0 {
            cell.textLabel?.text = list[indexPath.row]
            cell.textLabel?.font = .systemFont(ofSize: 16)
            cell.detailTextLabel?.text = detailList[indexPath.row]
            cell.detailTextLabel?.font = .systemFont(ofSize: 16)
            cell.detailTextLabel?.textColor = .lightGray
            cell.textLabel?.textColor = .white
            
            if indexPath.row == 0 {
                cell.imageView?.image = UIImage(systemName: images[indexPath.row])?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
            } else if indexPath.row == 1 {
                cell.imageView?.image = UIImage(systemName: images[indexPath.row])?.withTintColor(.orange, renderingMode: .alwaysOriginal)
            } else if indexPath.row == 2 {
                cell.imageView?.image = UIImage(systemName: images[indexPath.row])?.withTintColor(.green, renderingMode: .alwaysOriginal)
            } else {
                cell.imageView?.image = UIImage(systemName: images[indexPath.row])?.withTintColor(.cyan, renderingMode: .alwaysOriginal)
            }
        } else {
            cell.textLabel?.text = "모든 기기에서 공유"
            cell.textLabel?.font = .systemFont(ofSize: 16)
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.text = nil
            
            let cellSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            cell.accessoryView = cellSwitch
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "모드 설정"
        } else {
            return " "
        }
    }
    
    // footer의 경우 높이를 설정해주어야 title이 보인다.
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "집중 모드에서는 경고 및 알람이 울리지 않습니다."
        } else {
            return "이 기기에서 집중 모드를 켜면 사용자의 다른 기기에서도 집중 모드가 켜집니다."
        }
    }
    
}
