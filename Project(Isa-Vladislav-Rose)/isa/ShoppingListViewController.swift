//
//  ShoppingListViewController.swift
//  Project(Isa-Vladislav-Rose)
//
//  Created by Иса on 04.12.2022.
//

import UIKit

class ShoppingListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pr1 = Purchase(name: "хлеб", quantity: 2, price: 30)
        var shoppingOne = ShoppingLists("супермаркет")
        shoppingOne.setPurchase(pr1, index: nil)
        let shoppingTwo = ShoppingLists("рынок")
        shoppingLists.append(shoppingOne)
        shoppingLists.append(shoppingTwo)
        
    }
    
    @IBAction func newShoppingList(_ sender: Any) {
        let alert = UIAlertController(title: "Новая метка", message: "Введите имя метки", preferredStyle: .alert)
        alert.addTextField()
        let ok = UIAlertAction(title: "Ok", style: .default) { action in
            guard let text = alert.textFields?.first?.text else { return }
            if !text.isEmpty {
                let newShopping = ShoppingLists(text)
                shoppingLists.append(newShopping)
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if shoppingLists[indexPath.row].totalPrice == 0 {
            return 50
        } else {
            return 70
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        shoppingLists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let shoppingCell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell", for: indexPath) as? ShoppingListViewCell
        else { return UITableViewCell() }
        shoppingCell.configure(shoppingLists[indexPath.row])
        return shoppingCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingLists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}
