//

import UIKit

final class GoodsDataSource: NSObject {

    private let tableView: UITableView
    private var goods = [Item]()
    
    init(tableView: UITableView, from path: String) {
        self.tableView = tableView
        super.init()
        readFromPlist(name: path)
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func locationAtIndexPath(_ indexPath: IndexPath) -> Item? {
        return indexPath.row < goods.count ? goods[indexPath.row] : nil
    }
    
    //Здесь я понял, что item худшее имя для структуры в контексте товаров
    private func readFromPlist(name: String) {
        guard let items = NSArray(contentsOfFile: name) as? [Dictionary<String,String>] else {
            return
        }
        for item in items {
            if let oneOfGoods = Item(dictionary: item) {
                goods.append(oneOfGoods)
            }
        }
    }
}

extension GoodsDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemCell.reuseIdentifier, for: indexPath)
        configure(cell: cell, indexPath: indexPath)
        return cell
    }
    
    private func configure(cell: UITableViewCell, indexPath: IndexPath) {
        if let cell = cell as? ItemCell {
            let object = goods[indexPath.row]
            cell.configure(object: object)
        }
    }
}

//extension GoodsDataSource : NSCoding {
//    func encode(with aCoder: NSCoder) {
//        <#code#>
//    }
//    
//    convenience init?(coder aDecoder: NSCoder) {
//        <#code#>
//    }
//}
//
