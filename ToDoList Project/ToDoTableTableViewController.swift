//
//  ToDoTableTableViewController.swift
//  ToDoList Project
//
//  Created by scholar on 8/1/22.
//

import UIKit

class ToDoTableTableViewController: UITableViewController {
    
    var toDos : [ToDoCD] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func createToDos() -> [ToDo]{
        
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the Dog"
        //important set to false by default
        
        return [swift, dog]
    }
    
    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            if let coreDataToDos = try? context.fetch(ToDoCD.fetchRequest())as? [ToDoCD] {
                    toDos = coreDataToDos
                    tableView.reloadData()
            }
            
        }
    }
    
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name{
            if toDo.important {
            cell.textLabel?.text = "!" + name
        }
        else{
            cell.textLabel?.text = toDo.name
        }
        }

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    //user taps on to do initiate segue from to Do list
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        let toDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    //The array lives in this class, to allows the next class to inherit this class array
    
    //function is called whether we segue to addtodo or complete to do
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? createToDoViewController{
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? completeToDoViewController{
            if let toDo = sender as? ToDoCD{
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
