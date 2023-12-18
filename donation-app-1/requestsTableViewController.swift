//
//  requestsTableViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 24/11/23.
//

import UIKit
import FirebaseDatabaseInternal

class requestTableViewCell: UITableViewCell {
    var index: Int = 0
    
    @IBOutlet var userLabel: UILabel!
    @IBOutlet var goalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
}

class requestsTableViewController: UITableViewController {
    
    @IBOutlet var myTable: UITableView!
    //    present(requestPopupViewController(), animated: true, completion: nil)
    
    var requests: [Request] = [] {
        didSet {
            myTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gradient.png")!)
        myTable.backgroundView = UIImageView(image: UIImage(named: "gradient.png"))
        myTable.delegate = self
        myTable.dataSource = self
        
        fetchData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.requests.count
    }

    var i = 0
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell", for: indexPath) as! requestTableViewCell
        
        // import three arrays (titles, descriptions, goals) from database and assign to cell labels (example below) (can import in Organization model file
        
        // demo data for now
        let data = self.requests
        print(i)
        cell.userLabel?.text = data[i].user
        cell.descriptionLabel?.text = data[i].description
        cell.goalLabel?.text = data[i].goal
        cell.index = i
        i = i + 1
        
        return cell
    }
    
    func fetchData() {
        //        print("In fetchData()")
        //        var Organisations:[Organization] = []
        requests.removeAll()
        let dataReference = Database.database().reference().child("Requests")
        //print(dataReference)
        // Observe for changes in the data
        dataReference.observeSingleEvent(of: .value) { snapshot in
            
            for userSnapshot in snapshot.children {
                //                print(userSnapshot)
                let userAppointmentsSnapshot = userSnapshot as? DataSnapshot
                let name = userAppointmentsSnapshot!.childSnapshot(forPath: "name").value as? String
                let description = userAppointmentsSnapshot!.childSnapshot(forPath: "description").value as? String
                let goal = userAppointmentsSnapshot!.childSnapshot(forPath: "goal").value as? String
                //                    else {
                //                        print("In else")
                //                        continue
                //                    }
                //                print(userAppointmentsSnapshot)
                //
                //                guard let appointmentDataSnapshot = appointmentSnapshot as? DataSnapshot,
                
                
                //                print(name)
                //                print(description)
                //                print(goal ?? "0")
                let req = Request(user: name ?? "", description: description ?? "", goal: goal ?? "0")
                //                print(org)
                self.requests.append(req)
                //                print(self.organisations)
                self.myTable.reloadData()
                //
                //                for appointmentSnapshot in userAppointmentsSnapshot.children {
                //                    print(appointmentSnapshot)
                //
                //                }
            }
        }
        //        dataReference.observeSingleEvent(of: .value) { (snapshot) in
        //            // Check if the snapshot has data
        //            guard let value = snapshot.value as? [String: Any] else {
        //                print("No data found.")
        //                return
        //            }
        //
        //            // Process the data
        //            print("Data from Firebase: \(value)")
        //        }
        //
        //        return self.organisations.count
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    @IBOutlet var requestTableView: UITableView!
    
    @IBOutlet var DonateButton: UIButton!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "donateSegue" {
            let donateVC = segue.destination as! donatePopupViewController
            
            let selectedRow = requestTableView.indexPathForSelectedRow!.row
            
            let data = self.requests
            
            donateVC.titleLabel = data[selectedRow].user
            
            donateVC.goalLabel = data[selectedRow].goal
            
            donateVC.descriptionLabel = data[selectedRow].description
        }
        
    }
//    override func viewWillAppear(_ animated: Bool) {
//        i=0
//        fetchData()
//        myTable.reloadData()
//    }
}
