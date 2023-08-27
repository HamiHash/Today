//
//  ReminderListViewController.swift
//  Today
//
//  Created by Hamed Hashemi on 8/26/23.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
   
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout() /// Calling the function bellow, it returns a UICollectionViewCompositionalLayout
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        // Snapshot
        var snapshot = Snapshot()
        snapshot.appendSections([0]) /// adding a single section.
        /// Create a new array containing only the reminder titles, and append the titles as items in the snapshot.
        snapshot.appendItems(Reminder.sampleData.map { (item) -> String in item.title })
        dataSource.apply(snapshot) /// Apply the snapshot to the data source. Applying the snapshot reflects the changes in the user interface.
        
        // Assign the data source to the collection view.
        collectionView.dataSource = dataSource
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
}
