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
	"test the chain of services from browser service to method service"

	| projectNames projectService packageNames packageService classNames classService instanceMethodNames classMethodNames methodService |
	projectNames := browserService projectNames.
	self
		assert:
			{'Cypress'.
			'FileSystemGs'.
			'gemstoneBaseImage'.
			'RemoteServiceReplication'.
			'Rowan'.
			'STON'.
			'UnPackaged'.
			'Wabash'} = projectNames.
	projectService := browserService projectNamed: 'STON'.
	packageNames := projectService packageNames.
	self
		assert:
			{'STON-Core'.
			'STON-GemStone-Kernel'.
			'STON-GemStone-Kernel36x'.
			'STON-GemStoneBase'.
			'STON-GemStoneCommon'} = packageNames.
	packageService := projectService packageNamed: 'STON-Core'.
	classNames := packageService classNames.
	self
		assert:
			{'STON'.
			'STONListWriter'.
			'STONMapWriter'.
			'STONReader'.
			'STONReaderError'.
			'STONReference'.
			'STONShortListWriter'.
			'STONStreamWriter'.
			'STONWriter'.
			'STONWriterError'} = classNames.
	classService := packageService classNamed: 'STONReaderError'.
	instanceMethodNames := classService instanceMethodNames.
	self
		assert:
			{'buildMessageText'.
			'streamPosition'.
			'streamPosition:'} = instanceMethodNames.
	classMethodNames := classService classMethodNames.
	self assert: {'signal:streamPosition:'} = classMethodNames.
	methodService := classService instanceMethodNamed: 'streamPosition:'.
	self assert: methodService methodName = 'streamPosition:'
]
