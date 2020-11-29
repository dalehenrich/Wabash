Class {
	#name : 'WbshLoginWindow',
	#superclass : 'Model',
	#instVars : [
		'label',
		'initiator',
		'connection',
		'client'
	],
	#category : 'Wabash-Pharo'
}

{ #category : 'private' }
WbshLoginWindow class >> builder [
	"Answer a morph that implements TEasilyThemed but without honouring modality
	for the example dialogs."
	^ExampleBuilderMorph new
]

{ #category : 'open' }
WbshLoginWindow class >> login [
	self new buildButton openInWindow
]

{ #category : 'actions' }
WbshLoginWindow >> action [
	"login to the server and initialize the client"

	| host port |
	false ifTrue: [ self class builder message: -2 printString title: 'client _id'.
	{'xxx'} inspect.
	^self ]. 
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	connection := initiator connect.
	client := connection serviceFor: #WbshProjectsServiceClient.
	self class builder message: client _id printString title: 'client _id'.
	client inspect.
]

{ #category : 'building' }
WbshLoginWindow >> buildButton [
	^ PluggableButtonMorph
		on: self 
		getState: nil
		action:  #action 
		label: #label 
		menu: nil. 	
]

{ #category : 'accessing' }
WbshLoginWindow >> label [
	^ label ifNil: [ 'Log in' ]
]
