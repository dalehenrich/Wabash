Class {
	#name : 'WabashSystemEnvironment',
	#superclass : 'ClySystemEnvironment',
	#category : 'Wabash-Pharo'
}

{ #category : 'accessing' }
WabashSystemEnvironment class >> currentImage [
	^currentImage ifNil: [
		currentImage := self new
			name: 'remote gemstone';
			globals: Smalltalk globals;
			packageOrganizer: RPackageOrganizer default;
			changesAnnouncer: SystemAnnouncer uniqueInstance]
]
