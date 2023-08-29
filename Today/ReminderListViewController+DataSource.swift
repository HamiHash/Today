//
//  ReminderListViewController+DataSource.swift
//  Today
//
//  Created by Hamed Hashemi on 8/27/23.
//

import UIKit

// Datasource

extension ReminderListViewController {
    typealias DataSource = UICollectionViewDiffableDataSource<Int, Reminder.ID> /// <SectionIdentifierType ,ItemIdentifierType>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Reminder.ID> /// <SectionIdentifierType ,ItemIdentifierType>
    
    func cellRegistrationHandler(cell: UICollectionViewListCell, indexPath: IndexPath, id: Reminder.ID) {
        let reminder = reminders[indexPath.item]
        var ourContentConfiguration = cell.defaultContentConfiguration()
        
        ourContentConfiguration.text = reminder.title
        /// assign the reminder due date’s
        ourContentConfiguration.secondaryText = reminder.dueDate.dayAndTimeText /// calling our custom method on 'Date' class that we made in Date+Today.swift file.
        /// Change the secondary text’s font to .caption1.
        ourContentConfiguration.secondaryTextProperties.font = UIFont.preferredFont(forTextStyle: .caption1)
        
        // Setting the configuration
        cell.contentConfiguration = ourContentConfiguration
        
        // Button
        var doneButtonConfiguration = doneButtonConfiguration(for: reminder)
        doneButtonConfiguration.tintColor = .todayListCellDoneButtonTint
        cell.accessories = [
            .customView(configuration: doneButtonConfiguration),
            .disclosureIndicator(displayed: .always) /// its that litle icon >
        ]
        
        // Background color
        var backGroundConfiguration = UIBackgroundConfiguration.listGroupedCell()
        backGroundConfiguration.backgroundColor = .todayListCellBackground
        cell.backgroundConfiguration = backGroundConfiguration
    }
    
    private func doneButtonConfiguration(for reminder: Reminder) -> UICellAccessory.CustomViewConfiguration {
        // Symbol
        let symbolName = reminder.isComplete ? "circle.fill" : "circle"
        let symbolConfiguration = UIImage.SymbolConfiguration(textStyle: .title1)
        let image = UIImage(systemName: symbolName, withConfiguration: symbolConfiguration)
        // Button
        let button = UIButton()
        button.setImage(image, for: .normal)
        return UICellAccessory.CustomViewConfiguration(customView: button, placement: .leading(displayed: .always))
    }
}
