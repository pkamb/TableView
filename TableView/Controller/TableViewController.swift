//
//  TableViewController.swift
//  TableView
//
//  Created by Peter Kamb on 1/16/19.
//  Copyright © 2019 Peter Kamb. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    static var reuseIdentifier = "TableViewCell"
    
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var cellTextLabel: UILabel!
}

protocol TableViewCellViewModel {
    var labelText: String { get }
}

class TableViewController: UITableViewController {
    
    var photos = [LoremPicsum.Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoremPicsum.getPhotos { photos in
            self.photos = photos ?? []
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}

extension TableViewController { // UITableViewDataSource
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else {
            fatalError("Error dequeuing cell")
        }
        
        let viewModel: TableViewCellViewModel = photos[indexPath.row] 
        
        cell.cellTextLabel.text = viewModel.labelText
        
        return cell
    }
    
}
