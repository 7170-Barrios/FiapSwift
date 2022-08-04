//
//  ProblemVisualizationViewController.swift
//  AgostinhoDanielaLuizViniciusWesley
//
//  Created by Agostinho José Schlindwein on 03/08/22.
//

import UIKit

class ProblemVisualizationViewController: UIViewController {
    @IBOutlet weak var labelProblem: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelInputDate: UILabel!
    @IBOutlet weak var textViewDetails: UITextView!
    
    var problem: Problem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ProblemFormViewController
        vc?.problem = problem
    }
    
    override func viewWillAppear(_ animated: Bool){
        labelProblem.text = problem.problem
        labelInputDate.text = problem.inputDate
        labelAddress.text = problem.address
        textViewDetails.text = problem.details
    }

}
