//
//  ShoppingTableViewCell.swift
//  SeSacTableView
//
//  Created by hwijinjeong on 1/7/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var checkBoxBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
