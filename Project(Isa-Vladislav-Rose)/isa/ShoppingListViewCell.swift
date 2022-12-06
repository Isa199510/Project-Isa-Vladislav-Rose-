//
//  ShoppingListViewCell.swift
//  Project(Isa-Vladislav-Rose)
//
//  Created by Иса on 04.12.2022.
//

import UIKit

class ShoppingListViewCell: UITableViewCell {
    
    @IBOutlet var nameShoppingListLabel: UILabel!
    @IBOutlet var totalPriceShoppingLabel: UILabel!
    @IBOutlet var imageCheckbox: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        imageCheckbox.addGestureRecognizer(tap)
        imageCheckbox.isUserInteractionEnabled = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ shopping: ShoppingLists) {
        nameShoppingListLabel.text = shopping.name
        totalPriceShoppingLabel.text = shopping.totalPrice == 0 ? "" : String(format: "Общая сумма: %.1f₽", shopping.totalPrice)
        imageCheckbox.image = UIImage(named: "checkboxFalse")
    }
    
    @objc func tappedImage() {
        imageCheckbox.image = imageCheckbox.image == UIImage(named: "checkboxFalse") ? UIImage(named: "checkboxTrue") : UIImage(named: "checkboxFalse")
    }

}
