//
//  AddViewController.swift
//  ToDoList3
//
//  Created by Yuji Ishikawa on 2018/09/26.
//  Copyright © 2018年 Yuji Ishikawa. All rights reserved.
//

import UIKit


class AddViewController: UIViewController {
    @IBOutlet var textfield: UITextField?
    var saveData:UserDefaults = UserDefaults.standard
    var todoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }

    
    @IBAction func add(){
        if textfield?.text != ""{
            
            todoArray = saveData.array(forKey: "todo") as! [String]
            todoArray.append((textfield?.text)!)
            saveData.set(todoArray, forKey: "todo")
            print(todoArray)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}


// 新しくなった配列にプラスされるようにしないといけない
