//
//  ViewController.swift
//  GraphqlSample
//
//  Created by 工藤海斗 on 2020/09/08.
//  Copyright © 2020 工藤海斗. All rights reserved.
//

import UIKit

protocol ViewProtocol {
    func reloadData()
}

class ViewController: UIViewController {
    
    @IBOutlet weak var cityTable: UITableView!
    
    var cities = [AllCityQuery.Data.AllCity]()
    var viewPresenter: ViewPresenter!
    
    enum ListSection: Int, CaseIterable {
        case cities
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewPresenter = ViewPresenter(view: self)
        cityTable.dataSource = self
        
        viewPresenter.loadCities(completion: { cities in
            self.cities = cities
            print(self.cities)
        })
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let listSection = ListSection(rawValue: section) else {
            assertionFailure("Invalid section")
            return 0
        }
        switch listSection {
        case .cities:
            print(cities.count)
            return cities.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cityTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        guard let listSection = ListSection(rawValue: indexPath.section) else {
            assertionFailure("Invalid section")
            return cell
        }
        
        switch listSection {
        case .cities:
            let city = self.cities[indexPath.row]
            cell.textLabel?.text = city.name
        }
        return cell
    }
}

extension ViewController: ViewProtocol {
    func reloadData() {
        self.cityTable.reloadData()
    }
}
