# Import file "navMenu"
sketch = Framer.Importer.load("imported/navMenu@1x")

hamburger = new Layer
	x: 20
	y: 10
	height: 100
	width: 200
	backgroundColor: null

#invokes Nav menu	
hamburger.on Events.Click, ->
	sketch.navbar.animate
		properties:
			x: 0
		time: 0.2


#set scrolling on nav			
scrollNav = ScrollComponent.wrap(sketch.scrollableText)
scrollNav.superLayer = sketch.navbar
scrollNav.scrollHorizontal = false
scrollNav.contentInset = 
	bottom: 15
	
sketch.navbar.bringToFront()


#set scrolling on notes	
scrollHome = ScrollComponent.wrap(sketch.scrollContent)
scrollHome.scrollHorizontal = false

notes = [sketch.note, sketch.note1, sketch.note2, sketch.note3, sketch.note4, sketch.note5, sketch.note6, sketch.note7, sketch.note8]

sketch.mainNote.x = 750
sketch.mainNote.y = 0

test = new Layer
	backgroundColor: "red"
	visible: false
	
for note in notes
	note.on Events.Click, ->
		if sketch.navbar.x == 0
			sketch.navbar.animate
				properties:
					maxX: 0
				time: 0.3
		else
			sketch.navbar.animate
				properties:
					maxX: 0
				time: 0.2
				
			sketch.mainNote.animate
				properties:
					x: 0
				time: 0.2
			hamburger.ignoreEvents = true
			
	note.on Events.MouseOver, ->
		this.animate
			properties:
				brightness: 90
			time: 0.2
			
	note.on Events.MouseOut, ->
		this.animate
			properties:
				brightness: 100
			time: 0.2
			
chevron = new Layer
	x: 20
	y: 10
	width: 300
	backgroundColor: null
	
ellipses = new Layer
	x: 630
	y: 10
	height: 110
	backgroundColor: null
	
chevron.superLayer = sketch.mainNote
ellipses.superLayer = sketch.mainNote


#go back from note to home
chevron.on Events.Click, ->
	sketch.mainNote.animate
		properties:
			x: 750
		time: 0.2
	sketch.mainNote.brightness = 100	
	sketch.menu.y = 1334
	hamburger.ignoreEvents = false
	
#invoke menu
sketch.menu.y = 1334
ellipses.on Events.Click, ->
	sketch.menu.animate
		properties:
			maxY: 1282
		time: 0.2
		
	sketch.mainNote.animate
		properties:
			brightness: 80
		time: 0.3
		

sketch.mainNote.on Events.Click, ->
	sketch.menu.animate
		properties:
			y: 1334
		time: 0.2
	this.brightness = 100

			
		
				
	

