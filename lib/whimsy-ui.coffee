WhimsyUiView = require './whimsy-ui-view'
{CompositeDisposable} = require 'atom'

module.exports = WhimsyUi =
  whimsyUiView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @whimsyUiView = new WhimsyUiView(state.whimsyUiViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @whimsyUiView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'whimsy-ui:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @whimsyUiView.destroy()

  serialize: ->
    whimsyUiViewState: @whimsyUiView.serialize()

  toggle: ->
    console.log 'WhimsyUi was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
