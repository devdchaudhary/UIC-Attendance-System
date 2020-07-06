//
//  LoadingScreen.swift
//  UIC Attendance System
//
//  Created by dddiehard21 on 06/07/20.
//  Copyright © 2020 dddiehard21. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseDatabase

class AttendanceViewController: UITableViewController {

    var ref:FIRDatabaseReference!

    @IBOutlet weak var logoutButton: UIBarButtonItem!

    var calledValues = [Attendance]()

    override func viewWillAppear(_ animated: Bool) {

        tableView.delegate = self

        tableView.dataSource = self

        super.viewWillAppear(animated)

        let loginAlert = UIAlertController(title: "Welcome!", message: "", preferredStyle: .alert)

        loginAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(loginAlert, animated: true, completion: nil)

        ref = FIRDatabase.database().reference()

        debugPrint("Values Called")

        devAttendance()

        vikAttendance()

        praAttendance()

        priAttendance()

    }

    func priAttendance() {

        ref.child("Attendance").child("Priyanshul").observe(FIRDataEventType(rawValue: calledValues.count)!, with: { (snapshot) in

            let results = snapshot.value as? [String : AnyObject]

            let date = results?["Date"]
            let csa = results?["Computer System Architecture"]
            let mad = results?["Mobile Application Development"]
            let mpi = results?["Microprocessor and Interfacing"]
            let st = results?["Software Testing"]
            let madlab = results?["Mobile Application Development Lab"]
            let mpilab = results?["Microprocessor and Interfacing Lab"]

            let myCalls = Attendance(date: date as! String?, csa: csa as! String?, mad: mad as! String?, mpi: mpi as! String?, st: st as! String?, madlab: madlab as! String? , mpilab: mpilab as! String?)

            debugPrint("Values Printed")

            self.calledValues.append(myCalls)

            DispatchQueue.main.async {

                self.tableView.reloadData()

            }

            print(snapshot)
            debugPrint(snapshot)

        }) { (error) in

            print(error.localizedDescription)

        }
    }

    func praAttendance() {

        ref.child("Attendance").child("Prashant").observe(FIRDataEventType(rawValue: calledValues.count)!, with: { (snapshot) in

            let results = snapshot.value as? [String : AnyObject]

            let date = results?["Date"]
            let csa = results?["Computer System Architecture"]
            let mad = results?["Mobile Application Development"]
            let mpi = results?["Microprocessor and Interfacing"]
            let st = results?["Software Testing"]
            let madlab = results?["Mobile Application Development Lab"]
            let mpilab = results?["Microprocessor and Interfacing Lab"]

            let myCalls = Attendance(date: date as! String?, csa: csa as! String?, mad: mad as! String?, mpi: mpi as! String?, st: st as! String?, madlab: madlab as! String? , mpilab: mpilab as! String?)

            debugPrint("Values Printed")

            self.calledValues.append(myCalls)

            DispatchQueue.main.async {

                self.tableView.reloadData()

            }

            print(snapshot)
            debugPrint(snapshot)

        }) { (error) in

            print(error.localizedDescription)

        }
    }

    func devAttendance() {

        ref.child("Attendance").child("Devanshu").observe(FIRDataEventType(rawValue: calledValues.count)!, with: { (snapshot) in

            let results = snapshot.value as? [String : AnyObject]

            let date = results?["Date"]
            let csa = results?["Computer System Architecture"]
            let mad = results?["Mobile Application Development"]
            let mpi = results?["Microprocessor and Interfacing"]
            let st = results?["Software Testing"]
            let madlab = results?["Mobile Application Development Lab"]
            let mpilab = results?["Microprocessor and Interfacing Lab"]

            let myCalls = Attendance(date: date as! String?, csa: csa as! String?, mad: mad as! String?, mpi: mpi as! String?, st: st as! String?, madlab: madlab as! String? , mpilab: mpilab as! String?)

            debugPrint("Values Printed")

            self.calledValues.append(myCalls)

            DispatchQueue.main.async {

                self.tableView.reloadData()

            }

            print(snapshot)
            debugPrint(snapshot)

        }) { (error) in

            print(error.localizedDescription)

        }
    }

    func vikAttendance() {

        ref.child("Attendance").child("Vikash").observe(FIRDataEventType(rawValue: calledValues.count)!, with: { (snapshot) in

            let results = snapshot.value as? [String : AnyObject]

            let date = results?["Date"]
            let csa = results?["Computer System Architecture"]
            let mad = results?["Mobile Application Development"]
            let mpi = results?["Microprocessor and Interfacing"]
            let st = results?["Software Testing"]
            let madlab = results?["Mobile Application Development Lab"]
            let mpilab = results?["Microprocessor and Interfacing Lab"]

            let myCalls = Attendance(date: date as! String?, csa: csa as! String?, mad: mad as! String?, mpi: mpi as! String?, st: st as! String?, madlab: madlab as! String? , mpilab: mpilab as! String?)

            self.calledValues.append(myCalls)

            DispatchQueue.main.async {

                self.tableView.reloadData()

            }

            print(snapshot)
            debugPrint(snapshot)

        }) { (error) in

            print(error.localizedDescription)

        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        debugPrint("Values Added to cells")

        let dataCell = tableView.dequeueReusableCell(withIdentifier: "attendanceCell", for: indexPath) as! AttendanceCell

        let values = calledValues[indexPath.row]

        dataCell.dateLabel?.text = values.date
        dataCell.csaLabel?.text = values.csa
        dataCell.madLabel?.text = values.mad
        dataCell.mpiLabel?.text = values.mpi
        dataCell.stLabel?.text = values.st
        dataCell.madlabLabel?.text = values.madlab
        dataCell.mpilabLabel?.text = values.mpilab

        return dataCell

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return calledValues.count

    }

    @IBAction func logoutAction(_ sender: Any) {

        let loginvc = self.storyboard!.instantiateViewController(withIdentifier: "loginvc")

        do {

            try FIRAuth.auth()?.signOut()

            self.present(loginvc, animated: true, completion: nil)

        } catch {

            print(error)

        }
    }
}
