Class {
	#name : 'WabashProjectServiceClient',
	#superclass : 'WabashProjectService',
	#category : 'Wabash-Client'
}

{ #category : 'accessing' }
WabashProjectServiceClient >> packageNamed: aString [
	^ (remoteSelf packageNamed: aString) wait
]

{ #category : 'accessing' }
WabashProjectServiceClient >> packageNames [
	^ remoteSelf packageNames wait
]
