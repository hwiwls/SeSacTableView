//
//  ShoppingTableViewController.swift
//  SeSacTableView
//
//  Created by hwijinjeong on 1/7/24.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    var list = ["갖고싶은 거 1", "갖고싶은 거 2", "갖고싶은 거 3", "갖고싶은 거 4"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        searchTextField.backgroundColor = .lightGray
        configAddBtn()
    }

    func configAddBtn() {
        addBtn.layer.cornerRadius = 5
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.checkBoxBtn.setImage(UIImage(systemName: "checkmark.square")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        cell.titleLabel.text = list[indexPath.row]
        cell.titleLabel.font = .systemFont(ofSize: 14)
        cell.titleLabel.textColor = .black
        
        cell.starBtn.setImage(UIImage(systemName: "star")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    @IBAction func addBtnClicked(_ sender: Any) {
        list.append(searchTextField.text!)
        tableView.reloadData()
    }
    
}
