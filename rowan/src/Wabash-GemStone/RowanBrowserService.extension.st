Extension { #name : 'RowanBrowserService' }

{ #category : '*wabash-gemstone' }
RowanBrowserService >> _projectNamed: aString [
	^ projects detect: [ :each | each name = aString ]
]

{ #category : '*wabash-gemstone' }
RowanBrowserService >> _projects [
	^ projects
]
