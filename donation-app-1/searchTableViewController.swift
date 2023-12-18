//
//  searchTableViewController.swift
//  donation-app-1
//
//  Created by Diya Talwar on 21/11/23.
//

import UIKit
import Firebase
import FirebaseDatabase
class searchTableViewCell: UITableViewCell {
    
    var index: Int = 0
    
//    weak var delegate: CustomCellDelegate?
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var goalLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    @IBAction func donateButtonAction(_ sender: UIButton) {
//        let selectedRow: Organization = Organization(title: self.titleLabel.text!, description: self.descriptionLabel.text!, goal: self.goalLabel.text!)
//        
//        // Call the delegate method
//        delegate?.didTapButton(with: selectedRow)
    }
    
}

//class filteringCollectionViewController: UICollectionViewController {
//    
//}

class searchTableViewController: UITableViewController {
    
    var organisations: [Organization] = []{
        didSet{
            myTable.reloadData()
        }
    }
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    @IBOutlet var myTable: UITableView!
    
    var i = 0
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "gradient.png")!)
        myTable.backgroundView = UIImageView(image: UIImage(named: "gradient.png"))
        myTable.delegate = self
        myTable.dataSource = self
        
        myTable?.rowHeight = 175
        myTable?.estimatedRowHeight = 175
        
        fetchData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func unwind(unwindSegue: UIStoryboardSegue) {
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //self.organisations = fetchData()
        return self.organisations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrganizationCell", for: indexPath) as! searchTableViewCell
        
        // import three arrays (titles, descriptions, goals) from database and assign to cell labels (example below) (can import in Organization model file
        
        // demo data for now
        let data = self.organisations
        print(data)
        cell.titleLabel?.text = data[i].title
        cell.descriptionLabel?.text = data[i].description
        cell.goalLabel?.text = data[i].goal
        cell.index = i
        i = i + 1
        
// EXAMPLE:
//        let country = countries[indexPath.row]
//        cell.countryTitleLabel?.text = country.name
//        cell.countryTextLabel?.text = country.isoCode
//        cell.countryImageView?.image = UIImage(named: country.isoCode)

//        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"

        return cell
    }
    
    func fetchData() {
//        print("In fetchData()")
//        var Organisations:[Organization] = []
        let dataReference = Database.database().reference().child("Organization")
        //print(dataReference)
        // Observe for changes in the data
        dataReference.observeSingleEvent(of:.value){
            snapshot  in
            
            for userSnapshot in snapshot.children {
                //                print(userSnapshot)
                let userAppointmentsSnapshot = userSnapshot as? DataSnapshot
                
                let id = userAppointmentsSnapshot

                let prog = userAppointmentsSnapshot!.childSnapshot(forPath: "progress").value as? String
                let name = userAppointmentsSnapshot!.childSnapshot(forPath: "name").value as! String
                let description = userAppointmentsSnapshot!.childSnapshot(forPath: "description").value as! String
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
                let org = Organization(title: name, description: description, goal: goal ?? "0", progress: prog, id: id)
                //                print(org)
                self.organisations.append(org)
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
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        // can store "category" of organization in struct and use it here to populate section name.
//            return "Section \(section)"
//    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "donationSegue"{
            let donateVC = segue.destination as! donatePopupViewController
            
            let selectedRow = myTable.indexPathForSelectedRow!.row
            
            print(selectedRow)
            
            let data = self.organisations
            
            donateVC.titleLabel = data[selectedRow].title
            
            donateVC.goalLabel = data[selectedRow].goal
            
            donateVC.descriptionLabel = data[selectedRow].description
            
            donateVC.progress = data[selectedRow].progress!
            
            donateVC.id = data[selectedRow].id!
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
