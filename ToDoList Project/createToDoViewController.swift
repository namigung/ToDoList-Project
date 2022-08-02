//
//  createToDoViewController.swift
//  ToDoList Project
//
//  Created by scholar on 8/1/22.
//

import UIKit

class createToDoViewController: UIViewController {
    
    //adds reference form previous outlet
    var previousVC = ToDoTableTableViewController()

    
    @IBOutlet weak var titleTextField: UITextField!

    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
        
    

    @IBAction func addTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            //we are creating a new ToDoCD object here, naming it toDo
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            //if the textfield has text we will call that text titleText
            
            if let titleText = titleTextField.text{
                //assigning
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            navigationController?.popViewController(animated: true)
        }
        
        /*
        let toDo = ToDo()
            
        if let titleText = titleTextField.text{
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
        }
            
            previousVC.toDos.append(toDo)
            previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true) //this brings the user back to the main page. Here, they will see their updated todo list
        */
        
        //accessing core data
        
        //we have to grab this view context to be able to work with Core Data

        
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
