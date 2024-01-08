//
//  ShoppingTableViewController.swift
//  SeSacTableView
//
//  Created by hwijinjeong on 1/7/24.
//

import UIKit

struct Wish {
    var wish: String
    var check: Bool
    var star: Bool
}

class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    var wishList: [Wish] = [Wish(wish: "맥라렌", check: false, star: false),
                            Wish(wish: "케로로 스티커", check: false, star: false),
                            Wish(wish: "케로로 공책", check: false, star: false),
                            Wish(wish: "케로로 인형", check: false, star: false),
                            Wish(wish: "기로로 토끼탈 스티커", check: false, star: false)]

    
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
        return wishList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.titleLabel.text = wishList[indexPath.row].wish
        cell.titleLabel.font = .systemFont(ofSize: 14)
        cell.titleLabel.textColor = .black
        
        let checkImage = wishList[indexPath.row].check == false ? "checkmark.square" : "checkmark.square.fill"
        cell.checkBoxBtn.setImage(UIImage(systemName: checkImage)?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        let starImage = wishList[indexPath.row].star == false ? "star" : "star.fill"
        cell.starBtn.setImage(UIImage(systemName: starImage)?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        cell.checkBoxBtn.tag = indexPath.row
        cell.starBtn.tag = indexPath.row
        
        cell.checkBoxBtn.addTarget(self, action: #selector(checkBoxBtnClicked), for: .touchUpInside)
        
        cell.starBtn.addTarget(self, action: #selector(starBtnClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkBoxBtnClicked(sender: UIButton) {
        print("check btn clicked")
        wishList[sender.tag].check.toggle()
        tableView.reloadData()
    }
    
    @objc func starBtnClicked(sender: UIButton) {
        print("\(sender.tag) star box clicked")
        wishList[sender.tag].star.toggle()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            wishList.remove(at: indexPath.row)
            
            tableView.reloadData()
        }
    }
    
    
    @IBAction func addBtnClicked(_ sender: Any) {
        wishList.append(Wish(wish: searchTextField.text!, check: false, star: false))
        tableView.reloadData()
    }
}
