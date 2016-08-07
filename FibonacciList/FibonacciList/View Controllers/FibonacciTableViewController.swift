//
//  FibonacciTableViewController.swift
//  FibonacciList
//
//  Created by DJ Mitchell on 8/6/16.
//  Copyright © 2016 Killectro. All rights reserved.
//

import UIKit

final class FibonacciTableViewController: UITableViewController {
    // MARK: - Public properties

    // MARK: - Private properties
    private let cellIdentifier = "fibonacciCell"
    // Lazy initialize number formatter
    private let formatter: NSNumberFormatter = {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        return formatter
    }()
    private var cellsToDisplay = 100
    private let fibonacci: (Int -> NSDecimalNumber) = memoize { (fibonacci: (Int -> NSDecimalNumber), n: Int) in
        return (n < 2) ? NSDecimalNumber(decimal: NSNumber(long: n).decimalValue) : fibonacci(n - 1).decimalNumberByAdding(fibonacci(n - 2))
    }

    // MARK: - View lifecycle
    override func viewDidLoad() {
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

// MARK: - Table view data source
extension FibonacciTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsToDisplay
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! FibonacciTableViewCell
        cell.numberLabel.text = formatter.stringFromNumber(fibonacci(indexPath.row + 1))
        return cell
    }

    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        // Emulate pagination since iOS table views don't have an option for first class infinite scrolling
        if indexPath.row == cellsToDisplay - 1 {
            cellsToDisplay += 100
            tableView.reloadData()
        }
    }
}
