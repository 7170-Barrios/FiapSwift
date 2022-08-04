//
//  ProblemFormViewController.swift
//  AgostinhoDanielaLuizViniciusWesley
//
//  Created by Agostinho José Schlindwein on 03/08/22.
//

import UIKit

class ProblemFormViewController: UIViewController {
    @IBOutlet weak var textFieldProblem: UITextField!
    @IBOutlet weak var textFieldInputDate: UITextField!
    @IBOutlet weak var textFieldAddress: UITextField!
    @IBOutlet weak var textViewDetails: UITextView!
    @IBOutlet weak var buttonSave: UIButton!
    
    var problem: Problem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let problem = problem {
            textFieldProblem.text = problem.problem
            textFieldAddress.text = problem.address
            textFieldInputDate.text = problem.inputDate
            textViewDetails.text = problem.details
            
            title = "Edição do Problema"
            buttonSave.setTitle("Atualizar", for: .normal)
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        if problem == nil {
            problem = Problem(context: context)
        }
        problem?.problem = textFieldProblem.text
        problem?.address = textFieldAddress.text
        problem?.inputDate = textFieldInputDate.text
        problem?.details = textViewDetails.text
        
        do {
            try context.save()
            navigationController?.popViewController(animated: true)
        } catch {
            print(error)
        }
    }
    
}
