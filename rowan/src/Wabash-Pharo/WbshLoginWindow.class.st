"
On server inspect result the following workspace:
	| host port acceptor connection server names semaphore |
	host := '127.0.0.1'.
	port := 47652.
	acceptor := RsrAcceptConnection
		host: host
		port: port.
	semaphore := Semaphore new.
	RsrProcessModel 
		fork: [ [connection := acceptor waitForConnection]
		ensure: [semaphore signal]].
	semaphore wait.
	connection

On client execute: 
	WbshLoginWindow login

A message dialog will pop up with the client _id. on the server inspect the following in the inspector for the first workspace:
	self serviceAt: <client _id>

On the server you have an inspector on the server-side service and an inspector on the client-side service ... you can send messages at will on either side ...

For my purposes, I will want to use client side doits to emulate the service side functionality ...
"
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
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	connection := initiator connect.
	client := connection serviceFor: #WbshProjectsServiceClient.
	self class builder message: client _id printString title: 'client _id'.
	client inspect.
	"
	RsrProcessModel fork: [ WbshProjectListExample openOn: client. ].
	Processor yield
	"
	
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
