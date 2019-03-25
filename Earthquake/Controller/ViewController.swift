//
//  ViewController.swift
//  Earthquake
//
//  Created by SHILEI CUI on 3/25/19.
//  Copyright © 2019 scui5. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    
    var json_arr : Array<Feature> = [] {
        didSet{
            DispatchQueue.main.async {
                self.tblView.delegate = self
                self.tblView.dataSource = self
                self.tblView.reloadData()
                //update UI like table reloading
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getApiForEq()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return json_arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "eqCell") as? EqTableViewCell
        
        let obj : Feature
        obj = json_arr[indexPath.row]
        
        cell?.lbl1.text = "Earthquake id: \(obj.id)"
        cell?.lbl2.text = "Magnitude: \(String(obj.properties.mag))"
        cell?.lbl3.text = "Place: \(obj.properties.place)"
        cell?.lbl4.text = "Time: \(timeFormatter(milisecond: Double(obj.properties.time)))"
        cell?.lbl5.text = "Significant: \(obj.properties.sig)"
        cell?.lbl6.text = "Statue: \(obj.properties.status)"
        
        return cell!
    }
    
    func getApiForEq() {
        Apihandler.sharedInstance.getApiForEq () {(eqs, error) in
            if error == nil{
                if let arr = eqs{
                        self.json_arr = arr
                }
            }
        }
    }
    
    func timeFormatter(milisecond : Double)-> String{
        let dateVar = Date.init(timeIntervalSince1970: TimeInterval(milisecond)/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy hh:mm"
        let res = dateFormatter.string(from: dateVar)
        return res
    }


}

