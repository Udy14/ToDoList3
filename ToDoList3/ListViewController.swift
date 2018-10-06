//
//  ListViewController.swift
//  ToDoList3
//
//  Created by Yuji Ishikawa on 2018/09/26.
//  Copyright © 2018年 Yuji Ishikawa. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var todotable: UITableView!
    var saveData:UserDefaults = UserDefaults.standard
    var todoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todotable.allowsMultipleSelection = true
        
        todotable.dataSource = self
        todotable.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if saveData.array(forKey: "todo") != nil{
            todoArray = saveData.array(forKey: "todo") as! [String]
            
        }
        todotable.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")
        cell?.textLabel?.text = todoArray[indexPath.row]
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            todoArray.remove(at: indexPath.row)
            saveData.set(todoArray, forKey: "todo")
            tableView.deleteRows(at: [indexPath], with: .fade)
            //            saveData.set("", forKey: "todo")
        }
        
    }
    
    @IBAction func edit(sender: AnyObject){
        if isEditing {
            super.setEditing(false, animated: true)
            todotable.setEditing(false, animated: true)
        } else {
            super.setEditing(true, animated: true)
            todotable.setEditing(true, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        cell?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath)
        
        cell?.accessoryType = .none
    }
    
    func todotable(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func todotable(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.textLabel?.text = "\(todoArray[indexPath.row])"
        
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    
    
}
    
//    func todotable(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
//
//    }
//}

//  UIseachBarDelegate
//        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
//        todotable = UITableView(frame: CGRect(x: 0, y: barHeight, width: self.view.frame.width, height: self.view.frame.height))
//        todotable.register(UITableViewCell.self, forCellReuseIdentifier: "todoCell")
//
//        searchbar = UISearchBar()
//        searchbar.delegate = self
//        searchbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 42)
//        searchbar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 89)
//        searchbar.showsSearchResultsButton = false
//        searchbar.placeholder = "search"
//        searchbar.setValue("cancel", forKey: "cancelButtonText")
//        searchbar.tintColor = UIColor.red
//        todotable.tableHeaderView = searchbar
//        navigationItem.leftBarButtonItem = editButtonItem
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell")
//        if searchbar.text != nil{
//            cell?.textLabel?.text = todoArray[indexPath.row]
//        }else{
//            cell?.textLabel?.text = "\(todoArray[indexPath.row])"
//        }
//        return cell!
//    }
//    func todotable(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        if searchbar.text != nil{
//            return searchResults.count
//        }else{
//            return todoArray.count
//        }
//    }

//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        self.view.endEditing(true)
//        searchBar.showsCancelButton = true
//        self.searchResults = todoArray.filter{
//            $0.lowercased().contains(searchBar.text!.lowercased())
//        }
//        self.todotable.reloadData()
//    }
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        searchBar.showsCancelButton = false
//        self.view.endEditing(true)
//        searchBar.text = ""
//        self.todotable.reloadData()
//    }
//
//    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
//        searchBar.showsCancelButton = true
//        return true
//    }
//
