#= require jquery
#= require underscore
#= require YouAreDaBomb
#= require YouAreDaBomb.shortcuts

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

  renderEmptyList: ->
    @container.empty()
    @container.append(@container_template())

  renderItemInList: (item)->
    list = @container.find('ul')
    list.append(@item_template(name: item))

class Glue

  constructor: (@useCase, @gui)->
    Before(@useCase, 'start', =>
      @gui.renderEmptyList()
    )
    After(@useCase, 'displayTask', (task)=>
      @gui.renderItemInList(task)
    )

window.run = ->
  gui = new GUI()
  useCase = new DisplayTasksUseCase(['do stuff', 'clean after'])
  app = new Glue(useCase, gui)
  useCase.start()
