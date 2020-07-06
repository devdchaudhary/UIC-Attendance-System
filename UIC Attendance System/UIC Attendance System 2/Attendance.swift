//
//  Atendance.swift
//  UIC Attendance System
//
//  Created by dddiehard21 on 06/07/20.
//  Copyright © 2020 dddiehard21. All rights reserved.
//

import Foundation
import UIKit

struct Attendance {

    var date: String?
    var csa: String?
    var mad: String?
    var mpi: String?
    var st: String?
    var madlab: String?
    var mpilab: String?

    init(date: String?, csa: String?, mad: String?, mpi: String?, st: String?, madlab: String?, mpilab: String?) {

        self.date = date
        self.csa = csa
        self.mad = mad
        self.mpi = mpi
        self.st = st
        self.madlab = madlab
        self.mpilab = mpilab

    }

}

