describe "Whimsy UI theme", ->
  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('whimsy-ui')

  it "allows the font size to be set via config", ->
    expect(document.documentElement.style.fontSize).toBe ''

    atom.config.set('whimsy-ui.fontSize', '10')
    expect(document.documentElement.style.fontSize).toBe '10px'

    atom.config.set('whimsy-ui.fontSize', 'Auto')
    expect(document.documentElement.style.fontSize).toBe ''

  it "allows the layout mode to be set via config", ->
    expect(document.documentElement.getAttribute('theme-whimsy-ui-layoutmode')).toBe 'auto'

    atom.config.set('whimsy-ui.layoutMode', 'Spacious')
    expect(document.documentElement.getAttribute('theme-whimsy-ui-layoutmode')).toBe 'spacious'
