Class {
	#name : 'WabashNavigationEnvironment',
	#superclass : 'ClyNavigationEnvironment',
	#category : 'Wabash-Pharo'
}

{ #category : 'default' }
WabashNavigationEnvironment class >> currentImage [
	^self defaultOver: WabashSystemEnvironment currentImage
]
