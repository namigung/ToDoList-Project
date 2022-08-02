//
//  completeToDoViewController.swift
//  ToDoList Project
//
//  Created by scholar on 8/1/22.
//

import UIKit

class completeToDoViewController: UIViewController {
    
    var previousVC = ToDoTableTableViewController()
    var selectedToDo : ToDoCD?

    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //grabs the name of the todo an assigns it to the text
        //question marks add is there is a selectedToDo
        titleLabel.text = selectedToDo?.name

        // Do any additional setup after loading the view.
    }
    
    //when tapping on a to do we want to initate segue from ToDo list to complete view controller. We have to segue name
    @IBAction func completeTapped(_ sender: Any) {
        //allows for deletion
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let theToDo = selectedToDo{
                titleLabel.text = "YAY. Congratulations-- on to the next task"
                context.delete(theToDo)
                /*navigationController?.popViewController(animated: true)*/
            }
        }
    }
    
    
    @IBAction func deleteButton(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let theToDo = selectedToDo{
                titleLabel.text = "Alright,move on now"
                context.delete(theToDo)
                /*navigationController?.popViewController(animated: true)*/
            }
        }
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
