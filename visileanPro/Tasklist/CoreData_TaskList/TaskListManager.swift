//
//  TaskListManager.swift
//  visileanPro
//
//  Created by Visilean Meet on 02/03/22.
//

import Foundation

import CoreData

struct TaskListManager{
    private let _TaskListDataRepo = TaskListDataRepo()
    
    func createTask(TaskListresult: TaskListResult) {
        _TaskListDataRepo.createTaskList(TaskListresult: TaskListresult)
    }
    
    func fetchTask() -> [TaskListResult]? {
        return _TaskListDataRepo.getall()
    }
    func getTaskDetails(projectGuid : String) -> TaskListCD?
    {
        return _TaskListDataRepo.getTaskDetails(projectGuid: projectGuid)
    }
    
    
   
}
