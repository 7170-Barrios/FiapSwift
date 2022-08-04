//
//  ProblemTableViewCell.swift
//  AgostinhoDanielaLuizViniciusWesley
//
//  Created by Agostinho José Schlindwein on 03/08/22.
//

import UIKit

class ProblemTableViewCell: UITableViewCell {

    @IBOutlet weak var labelProblem: UILabel!
    @IBOutlet weak var labelInputDate: UILabel!
    
    func configure(with problem: Problem) {
        labelProblem.text = problem.problem
        labelInputDate.text = problem.inputDate
    }

}
