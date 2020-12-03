Class {
	#name : 'WabashNavigationEnvironment',
	#superclass : 'ClyNavigationEnvironment',
	#category : 'Wabash-Pharo'
}

{ #category : 'default' }
WabashNavigationEnvironment class >> currentImage [
	^self defaultOver: WabashSystemEnvironment currentImage
]

{ #category : 'default' }
WabashNavigationEnvironment class >> defaultOver: aSystem [
	defaultGlobalEnvironments ifNil: [ defaultGlobalEnvironments := IdentityDictionary new ].
	
	^defaultGlobalEnvironments at: aSystem ifAbsentPut: [ 
		(WabashNavigationEnvironment over: aSystem)
			setUpAvailablePlugins;
			attachToSystem ]
]
