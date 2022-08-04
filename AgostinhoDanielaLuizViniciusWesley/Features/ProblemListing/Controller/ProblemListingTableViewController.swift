//
//  ProblemListingTableViewController.swift
//  AgostinhoDanielaLuizViniciusWesley
//
//  Created by Agostinho José Schlindwein on 03/08/22.
//

import UIKit
import CoreData

class ProblemListingTableViewController: UITableViewController {
    
    lazy var fetchedResultsController: NSFetchedResultsController<Problem> = {
        let fetchRequest: NSFetchRequest<Problem> = Problem.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "inputDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProblems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let vc = segue.destination as? ProblemVisualizationViewController,
              let indexPath = tableView.indexPathForSelectedRow else {return}
        vc.problem = fetchedResultsController.object(at: indexPath)
    }
                                              
    private func loadProblems(){
        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        //seção única - podia ser excluído / não precisa de override para 1
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let problemCell = tableView.dequeueReusableCell(withIdentifier: "problemCell", for: indexPath) as? ProblemTableViewCell else {
            return UITableViewCell()
        }
        let problem = fetchedResultsController.object(at: indexPath)
        problemCell.configure(with: problem)
        return problemCell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let problem = fetchedResultsController.object(at: indexPath)
            context.delete(problem)
            try? context.save()
        }
    }
}

extension ProblemListingTableViewController: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        tableView.reloadData()
    }
}
