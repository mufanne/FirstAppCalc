//
//  TableViewController.swift
//  ApiProject
//
//  Created by Асель Калиева on 27.02.2023.
//

import UIKit
import SDWebImage
import Alamofire
//import SVProgressHUD
import SwiftyJSON

class TableViewController: UITableViewController {
    
    @IBOutlet weak var searchbar: UISearchBar!

    //let searchController = UISearchController(searchResultsController: nil)
    
    var arrayMusic: [ITunesMusic] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadData(term: "Rihanna")
       
        //searchController.searchBar.delegate = self
        //searchController.searchBar.placeholder = "Search artist"
        //navigationItem.searchController = searchController
   
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 202
    }
    
    func downloadData(term: String){
        let parameters = ["term": "rihanna", "limit": 25] as [String: Any]
        AF.request("https://itunes.apple.com/search", method: .get, parameters: parameters).responseData {
            response in
            if response.response?.statusCode == 200{
                let json = JSON(response.data!)
                
                if let array = json["results"].array {
                    for item in array {
                        let music = ITunesMusic(json: item)
                        self.arrayMusic.append(music)
                    }
                }
                self.tableView.reloadData()
            }
        }
      
    }
   
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        arrayMusic.removeAll()
//        tableView.reloadData()
//        downloadData(term: searchBar.text!)
//    }
        
        
        // MARK: - Table view data source
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return arrayMusic.count
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
            cell.setData(music: arrayMusic[indexPath.row])
            // Configure the cell...
            
            return cell
        }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "VController") as! ViewController
        vc.music = arrayMusic[indexPath.row]
        navigationController?.show(vc, sender: self)
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
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

