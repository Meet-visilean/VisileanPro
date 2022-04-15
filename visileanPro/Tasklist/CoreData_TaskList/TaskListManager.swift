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
    func getTaskDetails(guid : String) -> TaskListCD?
    {
        return _TaskListDataRepo.getTaskDetails(byIdentifier: guid)
    }
    
    func updateTaskStauts(taskListResult: TaskListResult) -> Bool {
        return _TaskListDataRepo.updateStatusCode(taskListResult: taskListResult)
    }
    
    func updateTaskActivityType(taskListResult: TaskListResult) -> Bool {
        return _TaskListDataRepo.updateTaskType(taskListResult: taskListResult)
    }
    
   func gettaskdetaibyguid(guid : String)-> TaskListResult?
    {
        return _TaskListDataRepo.get(byIdentifier: guid)
    }
    
    
}
