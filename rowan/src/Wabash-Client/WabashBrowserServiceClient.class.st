Class {
	#name : 'WabashBrowserServiceClient',
	#superclass : 'WabashBrowserService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WabashBrowserServiceClient >> projectNames [
	^ remoteSelf projectNames wait
]
