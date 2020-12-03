Class {
	#name : 'WabashSystemEnvironment',
	#superclass : 'ClySystemEnvironment',
	#instVars : [
		'rsrConnection'
	],
	#classVars : [
		'RsrConnection'
	],
	#category : 'Wabash-Pharo'
}

{ #category : 'accessing' }
WabashSystemEnvironment class >> currentImage [
	^currentImage ifNil: [
		| packageService |
		packageService := ((WabashFullBrowser connection serviceFor: #'WabashBrowserService') projectNamed: 'Rowan').
		currentImage := self new
			name: 'remote gemstone';
			globals: (WabashFullBrowser connection serviceFor: #WabashSystemGlobalsService);
			packageOrganizer: packageService;
			changesAnnouncer: SystemAnnouncer uniqueInstance]
]

{ #category : 'accessing' }
WabashSystemEnvironment class >> rsrConnection [

	^ self validateRsrConnection
]

{ #category : 'rsr' }
WabashSystemEnvironment class >> validateRsrConnection [

	(RsrConnection notNil and: [ RsrConnection isOpen ]) ifFalse: [ 
		| host port initiator |
		host := '127.0.0.1'.
		port := 47652.
		initiator := RsrInitiateConnection host: host port: port.
		RsrConnection := initiator connect ].
	^RsrConnection

]

{ #category : 'accessing' }
WabashSystemEnvironment >> packages [

	self validateRsrConnection.
	^ super packages
]

{ #category : 'accessing' }
WabashSystemEnvironment >> validateRsrConnection [

	^ self class validateRsrConnection
]
