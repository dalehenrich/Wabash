"
On server execute the following in a topaz linked session:
	| host port acceptor connection |
	host := '127.0.0.1'.
	port := 47652.
	acceptor := RsrAcceptConnection
		host: host
		port: port.
	connection := acceptor waitForConnection.
	[ true ] whileTrue: [ (Delay forSeconds: 1) wait ]


On client execute the following in a playground: 
	| host port initiator |
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	connection := initiator connect.
	client := connection serviceFor: #WbshProjectsServiceClient.
	client inspect.

Use the inspector to send messages like: 
	self projectNames.
	WbshProjectListExample openOn: self

	

"
Class {
	#name : 'WbshAbstractProjectListExample',
	#superclass : 'MorphTreeModel',
	#instVars : [
		'listService',
		'selected'
	],
	#category : 'Wabash-Pharo'
}

{ #category : 'opening' }
WbshAbstractProjectListExample class >> openOn: aListServiceClient [
	self new openOn: aListServiceClient
]

{ #category : 'view' }
WbshAbstractProjectListExample >> defaultTreeMorph [
	^ super defaultTreeMorph
		multiSelection: true;
		autoMultiSelection: true;
		yourself
]

{ #category : 'opening' }
WbshAbstractProjectListExample >> openOn: aListServiceClient [
	listService := aListServiceClient.
	(self defaultTreeMorph buildContents
		embeddedInMorphicWindowLabeled: self title)
		openInWorld.

]

{ #category : 'accessing' }
WbshAbstractProjectListExample >> rootItems [
	self subclassResponsibility
]

{ #category : 'accessing' }
WbshAbstractProjectListExample >> selected [
	^ selected ifNil: [selected := 1]
]

{ #category : 'accessing' }
WbshAbstractProjectListExample >> selected: x [
	selected := x.
	self changed: #selected
]

{ #category : 'accessing' }
WbshAbstractProjectListExample >> title [
	self subclassResponsibility
]
