#= require jquery
#= require underscore

class DisplayTasksUseCase

  constructor: (tasks)->
    @tasks = tasks ? []

  start: ->
    @displayAllTasks()

  restart: (tasks)->
    @tasks = tasks if tasks?
    @start()

  displayAllTasks: ->
    _(@tasks).each(@displayTask)

  displayTask: (task)->
    console.log(task)

class GUI

  container_template: _.template("<ul></ul>")
  item_template: _.template("<li><%= name %></li>")

  constructor: ->
    @container = $('body')

  showList: ->
    @container.empty()
    @container.append(@container_template())

  showItemInList: (item)->
    el = @container.find('ul')
    el.append(@item_template(name: item))
