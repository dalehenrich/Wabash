Class {
	#name : 'WabashSystemEnvironment',
	#superclass : 'ClySystemEnvironment',
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
