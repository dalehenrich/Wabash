Class {
	#name : 'WabashBrowserServiceClient',
	#superclass : 'WabashBrowserService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WabashBrowserServiceClient >> projectNamed: aString [
	^ (remoteSelf projectNamed: aString) wait
]

{ #category : 'accessing' }
WabashBrowserServiceClient >> projectNames [
	^ remoteSelf projectNames wait
]
