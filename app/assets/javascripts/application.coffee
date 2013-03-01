#= require underscore

class DisplayTasksUseCase

  constructor: ->
    @tasks = []

  start: (tasks)->
    @tasks = tasks

  restart: (tasks)->
    @start(tasks)

  displayAllTasks: ->
    _(@tasks).each(@displayTask)

  displayTask: (task)->
    console.log(task)

class GUI

  constructor: ->
