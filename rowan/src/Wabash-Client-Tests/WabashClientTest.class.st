Class {
	#name : 'WabashClientTest',
	#superclass : 'TestCase',
	#instVars : [
		'browserService',
		'connection'
	],
	#category : 'Wabash-Client-Tests'
}

{ #category : 'running' }
WabashClientTest >> setUp [
	| host port initiator |
	super setUp.
	host := '127.0.0.1'.
	port := 47652.
	initiator := RsrInitiateConnection host: host port: port.
	connection := initiator connect.
	browserService := connection serviceFor: #'WabashBrowserService'
]

{ #category : 'running' }
WabashClientTest >> tearDown [
	super tearDown.
	connection ifNotNil: [ connection close ]
]

{ #category : 'tests' }
WabashClientTest >> testBrowser [
	| projectNames |
	projectNames := browserService projectNames.
	self
		assert:
			{'Cypress'.
			' FileSystemGs'.
			'gemstoneBaseImage'.
			'RemoteServiceReplication'.
			'Rowan'.
			'STON'.
			'Wabash'.
			'(UnPackaged)'} sort = projectNames
]
