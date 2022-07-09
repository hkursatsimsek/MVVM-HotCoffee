//
//  AddOrderViewController.swift
//  MVVM-HotCoffee
//
//  Created by Kürşat Şimşek on 29.06.2022.
//

import Foundation
import UIKit

class AddOrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var coffeeSizeSegmentedControl: UISegmentedControl!
    
    private var vm = AddCoffeeOrderViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tableView.dataSource = self
//        self.tableView.delegate = self
        
        setupUI()
    }
    
    private func setupUI() {
        self.coffeeSizeSegmentedControl = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSizeSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.coffeeSizeSegmentedControl)
        
        self.coffeeSizeSegmentedControl.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        self.coffeeSizeSegmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        
        cell.textLabel?.text = self.vm.types[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    
}
